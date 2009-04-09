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

class Repository < ActiveRecord::Base

## validations ###############################################################

  validates_presence_of   :name
  validates_uniqueness_of :name, :case_sensitive => false

## display shortcuts #########################################################

  def last_commit_committer
    return 'N/A' unless initialized?
    last_commit.committer
  end

  def last_commit_date
    return 'N/A' unless initialized?
    last_commit.committed_date.strftime('%B %d, %Y %H:%M')
  end

  def last_commit_message
    return 'Uninitialized' unless initialized?
    last_commit.message
  end

  def git
    @git ||= self.class.repo_for(path)
  end
  
  def tree(id)
    Tree.new(self, id)
  end

private ######################################################################

  def path
    # TODO: make this work with a configured repository root
    File.join(RAILS_ROOT, 'repositories', name)
  end

  def initialized?
    git && git.commits.length.nonzero?
  end

  def last_commit
   return nil unless initialized?
   git.commits.first
  end

  def self.repo_for(path)
    return nil unless File.exists?(path)
    @repos ||= {}
    @repos[path] ||= Grit::Repo.new(path)
  end

end
