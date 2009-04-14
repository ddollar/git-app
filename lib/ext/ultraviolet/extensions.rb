module Uv
  class << self
    attr_reader   :syntax_index
    attr_writer   :syntax_list, :default_syntax
    attr_accessor :syntax_path
    attr_accessor :ignored_syntaxes
  end

  Uv.syntax_path = File.join(Rails.root, 'lib', 'ultraviolet', 'syntax')

  def Uv.init_syntaxes
    @syntax_index = {}
    @syntaxes = syntaxes.inject({}) do |memo, syntax|
      syntax_file = File.join(syntax_path, "#{syntax}.syntax")
      if File.exist?(syntax_file)
        syntax_node = memo[syntax] = Textpow::SyntaxNode.load(File.join(syntax_path, "#{syntax}.syntax"))
        if syntax_node.fileTypes
          syntax_node.fileTypes.each do |type|
            @syntax_index[type] = syntax unless @syntax_index.key?(type)
          end
        end
      end
      memo
    end
    nil
  end

  def Uv.syntaxes
    if @syntax_list.nil?
      @syntax_list = Dir.glob( File.join(syntax_path, '*.syntax') ).collect! do |f| 
        File.basename(f, '.syntax')
      end
      @syntax_list = @syntax_list - ignored_syntaxes if ignored_syntaxes
    end
    @syntax_list
  end

  def Uv.syntax_for_file file_name
    init_syntaxes unless @syntax_index
    ext = File.extname(file_name)[1..-1]
    # if the extension isn't in there, look for the 'full' extension,
    # like '.html.erb'
    if @syntax_index[ext].nil? && file_name =~ /[^\.]+\.(.*$)/
      ext = $1 if ext != $1 
    end
    @syntax_index[ext] || default_syntax
  end

  def self.default_syntax
    @default_syntax ||= syntax_for_file("foo.txt")
  end
end