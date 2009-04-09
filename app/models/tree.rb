class Tree

  attr_reader :repository, :id

  def initialize(repository, id)
    @repository = repository
    id_parts    = id.split('/')
    @id         = id_parts.shift
    @path       = id_parts.join('/')
  end

  def nodes
    @nodes ||= tree.contents.map do |node|
      Node.new(repository, self, node.name)
    end
  end

  def node(path)
    @nodes_by_path       ||= {}
    @nodes_by_path[path] ||= tree / path
  end

  def commit(path)
    path = full_path(path)
    @commits       ||= {}
    @commits[path] ||= repository.git.log(id, path).first
  end

private ######################################################################

  def tree
    @tree ||= begin
      tree = repository.git.commits(id).first.tree
      @path.split('/').each do |part|
        tree = tree / part
      end
      Rails.logger.info tree.inspect
      tree
    end
  end

  def full_path(path)
    if @base_path.blank?
      path
    else
      "#{@base_path}/#{path}"
    end
  end

end
