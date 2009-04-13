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

  def to_param
    name
  end

## validations ###############################################################

  validates_presence_of   :name
  validates_uniqueness_of :name, :case_sensitive => false

  def git
    @git ||= self.class.repo_for(path)
  end
  
  def commits(id=nil)
    id ? Commit.new(self, id) : git.commits.map { |commit| Commit.new(self, commit.id) }
  end
  
  def last_commit
   return nil unless initialized?
   commits.first
  end

private ######################################################################

  def path
    # TODO: make this work with a configured repository root
    File.join(RAILS_ROOT, 'repositories', name)
  end

  def initialized?
    git && git.commits.length.nonzero?
  end

  def self.repo_for(path)
    return nil unless File.exists?(path)
    @repos ||= {}
    @repos[path] ||= Grit::Repo.new(path)
  end

end
