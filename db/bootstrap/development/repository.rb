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

keys = [ :name ]

data = [
  {
    :name   => "Public Repository 1",
    :public => true
  }
]

data.each do |record|
  Repository.create_or_update(record, keys)
end
