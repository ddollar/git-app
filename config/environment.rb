RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.time_zone = 'UTC'

  # templating
  config.gem 'haml', :version => '>= 2.0.9'

  # testing
  config.gem 'thoughtbot-shoulda',      :version => '>= 2.10.1', :lib => 'shoulda'
  config.gem 'thoughtbot-factory_girl', :version => '>= 1.2.0',  :lib => 'factory_girl'
  config.gem 'webrat',                  :version => '>= 0.4.0'
  config.gem 'rspec',                   :version => '>= 1.2.0',  :lib => false
  config.gem 'rspec-rails',             :version => '>= 1.2.0',  :lib => false

end
