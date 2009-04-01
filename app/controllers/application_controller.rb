# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

## authentication ############################################################

  def current_user
    session[:user]
  end

  def logged_in?
    !current_user.nil?
  end
  
  helper_method :current_user, :logged_in?

## settings ##################################################################

  layout 'application'

  protect_from_forgery

## authentication ############################################################

  filter_parameter_logging :password

## helpers ###################################################################

  helper :all # include all helpers, all the time

end
