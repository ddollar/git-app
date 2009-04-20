class Git::Blob < Git::Node

  def contents
    blob.data
  end

private ######################################################################

  def blob
    node
  end

end
