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

Factory.define :repository do |f|
  f.sequence(:name) { |n| "Repository #{n}" }
  f.sequence(:path) { |n| "repository#{n}"  }
  f.public          true
end
