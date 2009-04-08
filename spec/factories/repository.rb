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

Factory.define :repository do |f|
  f.sequence(:name)        { |n| "repository#{n}" }
  f.sequence(:description) { |n| "Repository #{n}"  }
  f.public                 true
end
