class Node

  def initialize(repo, commit, path)
    @repo   = repo
    @commit = commit
    @path   = path
  end

  def name
    node.name
  end

  def commit
    puts "COMMIT: #{@commit}  PATH: #{@path}"
    @repo.log(@commit, @path).first
  end

private ######################################################################

  def node
    @repo.commits(@commit).first.tree / @path
  end
  
end
