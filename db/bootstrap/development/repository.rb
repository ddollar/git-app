# == Schema Info
#
# Table name: repositories
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  path       :string(255)     not null
#  public     :boolean         not null
#  created_at :datetime
#  updated_at :datetime

keys = [ :name ]

data = [
  {
    :name   => 'Public Repository 1',
    :path   => 'repo_1',
    :public => true
  }
]

data.each do |record|
  Repository.create_or_update(record, keys)
end
