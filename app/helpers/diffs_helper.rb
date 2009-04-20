module DiffsHelper

  def syntax_highlighted_diff(diff)
    Albino.bin = '/usr/local/bin/pygmentize'
    Albino.colorize(diff.patch, :diff)
  end

end
