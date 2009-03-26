# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

## settings ##################################################################

  layout 'application'

  protect_from_forgery

## authentication ############################################################

  include Clearance::App::Controllers::ApplicationController

  filter_parameter_logging :password

## helpers ###################################################################

  helper :all # include all helpers, all the time

end
