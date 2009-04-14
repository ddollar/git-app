module FilesHelper

  def blob_syntax_highlighted_contents(blob)
    Uv.default_syntax = 'plain_text'
    Uv.init_syntaxes
    syntax = Uv.syntax_for_file blob.path
    Uv.parse blob.contents, 'xhtml', syntax, true, 'slush_poppies'
  end

  def node_breadcrumbs(node)
    base = []

    path_links = [ link_to(node.commit.repository.name, repository_commit_files_path(node.commit.repository, node.commit)) ]

    path_links += (node.path || '').split('/').map do |part|
      base << part
      link_to part, repository_commit_file_path(node.commit.repository, node.commit, base.join('/'))
    end

    path_links.join(' / ')
  end

  def node_name(node)    
    node.directory? ? "#{node.name}/" : node.name
  end

  def node_path(node)
    repository_commit_file_path(node.commit.repository, node.commit, node.path).gsub('%2F', '/')
  end

end
