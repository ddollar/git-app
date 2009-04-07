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

class Repository < ActiveRecord::Base

  def to_param
    path
  end

## validations ###############################################################

  validates_presence_of   :name
  validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of   :path
  validates_uniqueness_of :path, :case_sensitive => false

## display shortcuts #########################################################

  def last_commit_message
    return 'Uninitialized' unless initialized?
    last_commit.message
  end

  def last_commit_date
    return 'N/A' unless initialized?
    last_commit.committed_date.strftime('%B %d, %Y %H:%M')
  end

private ######################################################################

  def full_path
    # TODO: make this work with a configured repository root
    File.join(RAILS_ROOT, 'repositories', path)
  end

  def initialized?
    repo && repo.commits.length.nonzero?
  end

  def last_commit
    return nil unless initialized?
    repo.commits.first
  end

  def repo
    return nil unless File.exists?(full_path)
    Grit::Repo.new(full_path)
  end

end
