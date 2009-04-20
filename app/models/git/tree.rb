class Git::Tree < Git::Node

  def nodes
    @nodes ||= tree.contents.map do |node|
      Git::Node.new(commit, build_path(node))
    end.sort_by do |node|
      [ (node.directory? ? -1 : 1), node.name ]
    end
  end

private ######################################################################

  def build_path(node)
    path.blank? ? node.name : "#{path}/#{node.name}"
  end

  def tree
    node
  end

end
