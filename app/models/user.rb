require 'digest/sha1'

# == Schema Info
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  email              :string(255)     not null
#  encrypted_password :string(255)     not null
#  salt               :string(255)     not null
#  state              :string(255)     not null
#  created_at         :datetime
#  updated_at         :datetime

class User < ActiveRecord::Base

## setup #####################################################################

  attr_accessor   :password                                          #:nodoc:#
  attr_accessible :email, :password, :password_confirmation          #:nodoc:#
  before_save     :encrypt_password                                  #:nodoc:#

## associations ##############################################################

  has_many :guilds

## validations ###############################################################

  validates_presence_of     :email
  validates_uniqueness_of   :email, :case_sensitive => false
  validates_presence_of     :password,
                            :password_confirmation, :if => :password_required?
  validates_confirmation_of :password,              :if => :password_required?


## authentication ############################################################

  #
  # Returns a User model for a given email/password combination or
  # nil if no user matched
  #
  def self.authenticate(email, password)
    user =  User.find_by_email(email)
    user && user.has_password?(password) ? user : nil
  end

  #
  # Check to see if a given password is correct for this user
  #
  def has_password?(password)
    self.encrypted_password == encrypt(password)
  end

## activation ################################################################

  #
  # Request confirmation of the email address for this user
  #
  def request_confirmation
    # TODO: send activation email
  end

private ######################################################################

  def encrypt(password)
    generate_salt! if self.salt.blank?
    Digest::SHA1.hexdigest("@@#{self.salt}@@#{password}@@")
  end

  def encrypt_password
    self.encrypted_password = encrypt(self.password)
  end

  def generate_salt!
    self.salt = generate_random_hash
  end

  def generate_random_hash
    Digest::SHA1.hexdigest("@@#{Time.now.to_s}@@#{self.email}@@")
  end

  def password_required?
    self.encrypted_password.blank? || !self.password.blank?
  end

end
