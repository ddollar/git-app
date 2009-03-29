# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

## settings ##################################################################

  layout 'application'

  protect_from_forgery

## authentication ############################################################

  filter_parameter_logging :password

  def current_user
    Rails.env.development? ? User.first : session[:user]
  end

  helper_method :current_user
  private :current_user

## helpers ###################################################################

  helper :all # include all helpers, all the time

end
