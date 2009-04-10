module TreesHelper

  def node_breadcrumbs(node)
    base = []

    path_links = [ link_to(node.commit.repository.name, repository_commit_trees_path(node.commit.repository, node.commit)) ]

    path_links += (node.path || '').split('/').map do |part|
      base << part
      link_to part, repository_commit_tree_path(node.commit.repository, node.commit, base.join('/'))
    end

    path_links.join(' / ')
  end

  def node_path(node)
    repository_commit_tree_path(node.commit.repository, node.commit, node.path).gsub('%2F', '/')
  end
  
end
