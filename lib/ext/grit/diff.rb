class Grit::Diff

  def modified_file
    !(new_file || deleted_file)
  end

  def diff_type
    case
      when new_file      then :added
      when modified_file then :modified
      when deleted_file  then :deleted
    end
  end

end
