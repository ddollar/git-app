# == Schema Info
#
# Table name: repositories
#
#  id          :integer         not null, primary key
#  description :string(255)     not null
#  name        :string(255)     not null
#  public      :boolean         not null
#  created_at  :datetime
#  updated_at  :datetime

keys = [ :name ]

data = [
  {
    :description => 'Public Repository 1',
    :name        => 'repo_1',
    :public      => true
  }
]

data.each do |record|
  Repository.create_or_update(record, keys)
end
