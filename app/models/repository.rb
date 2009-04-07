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

## display shortcuts #########################################################

  def last_commit_message
    # TODO: actually implement
    'Funky Commit'
  end

  def last_commit_date
    # TODO: actually implement
    Time.now.strftime("%B %d, %Y %H:%M")
  end

## physical implementation ###################################################

  def full_path
    # TODO: make this work with a configured repository root
    File.join(RAILS_ROOT, 'repositories', name)
  end

end
