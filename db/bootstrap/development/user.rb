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

keys = [ :email ]

data = [
  {
    :admin                 => true,
    :email                 => 'ddollar@peervoice.com', 
    :name                  => 'David Dollar',
    :password              => 'test123', 
    :password_confirmation => 'test123',
    :ssh_key               => 'test-ssh-key'
  }
]

data.each do |record|
  User.create_or_update(record, keys)
end
