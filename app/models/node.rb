class Node

  attr_reader :repository, :tree, :path

  def initialize(repository, tree, path)
    @repository = repository
    @tree       = tree
    @path       = path
  end

  def id
    node.id
  end
  
  def name
    node.name
  end

  def commit
    Rails.logger.info "TREE PATH: #{path}"
    @commit ||= tree.commit(path)
  end
  
  def directory?
    node.is_a? Grit::Tree
  end
  
  def file?
    node.is_a? Grit::Blob
  end

private ######################################################################

  def node
    tree.node(@path)
  end
  
end
