class Node

  attr_reader :commit, :path

  def self.new(commit, path)
    if self == Node then
      raw_commit = commit.send(:commit)
      raw_commit = raw_commit.first if raw_commit.is_a?(Array)
      node = raw_commit.tree
      node = node / path unless path.blank?
      case node
        when Grit::Tree then Tree.new(commit, path)
        when Grit::Blob then Blob.new(commit, path)
      end
    else
      super
    end
  end

  def initialize(commit, path)
    @commit = commit
    @path   = path
  end

  def directory?
    self.is_a? Tree
  end

  def file?
    self.is_a? Blob
  end

  def name
    path.split('/').last
  end
  
  def committer
    raw_commit.committer
  end

  def message
    raw_commit.message
  end

  def date
    raw_commit.committed_date.strftime('%B %d, %Y %H:%M')
  end

  def raw_commit
    commit.repository.git.log(commit.id, path).first
  end

  def node
    @blob ||= begin
      blob = commit.repository.git.commits(commit.id).first.tree
      blob = blob / path unless path.blank?
      blob
    end
  end

end
