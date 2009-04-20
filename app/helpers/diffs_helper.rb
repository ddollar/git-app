module DiffsHelper

  def syntax_highlighted_diff(diff)
    patch = (diff.patch.split("\n")[2..-1] || []).join("\n")
    Albino.bin = '/usr/local/bin/pygmentize'
    Albino.colorize(patch, :diff)
  end

end
