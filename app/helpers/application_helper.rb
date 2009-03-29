module ApplicationHelper

## authentication ############################################################

  def current_user
    Rails.env.development? ? User.first : session[:user]
  end

## flash #####################################################################

  def flash_messages
    render 'layouts/flash', :flash => flash
  end

end
