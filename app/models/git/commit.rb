class Git::Commit

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

  def diffs(type=nil)
    return diffs_by_type(type) if type
    [ :added, :deleted, :modified ].map { |type| diffs_by_type(type) }.flatten
  end

private ######################################################################

  def commit
    @commit ||= @repository.git.commits(@id).first
  end
  
  def diffs_by_type(type)
    @diffs ||= commit.show.map { |diff| Git::Diff.new(diff) }
    @diffs.select { |d| d.send("#{type}?") }
  end

end
