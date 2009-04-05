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

  def last_commit_message
    'Funky Commit'
  end

  def last_commit_date
    Time.now.strftime("%B %d, %Y %H:%M")
  end

end
