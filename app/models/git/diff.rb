class Git::Diff

  attr_reader :diff

  def initialize(diff)
    @diff = diff
  end

  def path
    diff.b_path
  end

  def patch
    diff.diff
  end

  def added?
    diff.new_file
  end

  def deleted?
    diff.deleted_file
  end

  def modified?
    diff.modified_file
  end

end
