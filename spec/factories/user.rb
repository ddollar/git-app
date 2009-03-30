# == Schema Info
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  admin              :boolean         not null
#  email              :string(255)     not null
#  encrypted_password :string(255)     not null
#  name               :string(255)     not null
#  salt               :string(255)     not null
#  ssh_key            :text            not null
#  created_at         :datetime
#  updated_at         :datetime

Factory.define :user do |f|
  f.admin                 false
  f.sequence(:email)      { |n| "user#{n}@example.org" }
  f.password              'password'
  f.password_confirmation 'password'
  f.name                  'David Dollar'
  f.ssh_key               'test-ssh-key'
end
