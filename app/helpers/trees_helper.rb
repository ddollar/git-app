module TreesHelper

  def node_link(node)
    if node.directory?
      link_to node.name, node_url(node)
    else
      link_to node.name, node_url(node)
    end
  end
  
  def tree_id_for(node)
    if node.directory?
      [ node.tree.id, node.path ].join('/')
    else
      node.id
    end
  end

  def node_url(node)
    if node.directory?
      repository_tree_path(node.repository, tree_id_for(node)).gsub('%2F', '/')
    else
      repository_blob_path(node.repository, tree_id_for(node))
    end
  end

end
