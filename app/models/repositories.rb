# == Schema Info
#
# Table name: repositories
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  public     :boolean         not null
#  created_at :datetime
#  updated_at :datetime

class Repositories < ActiveRecord::Base
end
