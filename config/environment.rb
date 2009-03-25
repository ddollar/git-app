RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.time_zone = 'UTC'

  config.gem 'thoughtbot-clearance',    :version => '>= 0.5.4',  :lib => 'clearance'
  config.gem 'thoughtbot-shoulda',      :version => '>= 2.10.1', :lib => 'shoulda'
  config.gem 'thoughtbot-factory_girl', :version => '>= 1.2.0',  :lib => 'factory_girl'

end
