class Commit

  attr_reader :repository, :id

  def initialize(repository, id)
    @repository = repository
    @id         = id
  end

  def nodes(path=nil)
    Node.new(self, path)
  end

  def to_param
    id
  end
  
  def committer
    commit.committer
  end

  def message
    commit.message
  end

  def date
    commit.committed_date.strftime('%B %d, %Y %H:%M')
  end

private ######################################################################

  def commit
    @repository.git.commits(@id).first
  end

end
