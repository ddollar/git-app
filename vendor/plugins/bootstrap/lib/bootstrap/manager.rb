class Bootstrap::Manager

  @initializers = {}

  def self.initialize
    ActiveRecord::Base.class_eval do
      class << self
        def create_or_update_with_logging(record, keys)
          key_values = keys.sort.map do |key|
            value = record[key]
            value = "<#{value.class}:#{value.id}>" if value.is_a?(ActiveRecord::Base)
            "#{key}:#{value}"
          end.join(' ')
          
          puts "%15s [%s]" % [ self.to_s.humanize, key_values]

          create_or_update_without_logging(record, keys)
        end

        alias_method_chain :create_or_update, :logging
      end
    end
  end

  def self.load
    common_initializers = Dir[File.join(Bootstrap::ROOT_DIR, '*.rb')]
    env_initializers    = Dir[File.join(Bootstrap::ROOT_DIR, Rails.env, '*.rb')]

    @initializers.clear
    (common_initializers + env_initializers).each do |filename|
      identifier = File.basename(filename, File.extname(filename)).intern
      @initializers[identifier] = Bootstrap::Initializer.new(filename, identifier)
    end
  end

  def self.execute(identifier)
    raise "Unknown initializer: #{identifier}" unless @initializers.keys.include?(identifier)
    @initializers[identifier].execute
  end

  def self.execute_all
    @initializers.keys.each { |identifier| self.execute(identifier) }
  end

end
