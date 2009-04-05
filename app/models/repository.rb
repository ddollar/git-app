# == Schema Info
#
# Table name: repositories
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  public     :boolean         not null
#  created_at :datetime
#  updated_at :datetime

class Repository < ActiveRecord::Base

## validations ###############################################################

  validates_presence_of   :name
  validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of   :public

end
