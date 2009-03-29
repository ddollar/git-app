require 'digest/md5'

module ApplicationHelper

## authentication ############################################################

  def current_user
    session[:user]
  end

  def logged_in?
    !current_user.nil?
  end

## flash #####################################################################

  def flash_messages
    render 'layouts/flash', :flash => flash
  end

## users #####################################################################

  def gravatar_for_user(user)
    email_md5 = Digest::MD5.hexdigest(user.email)
    gravatar_uri = "http://www.gravatar.com/avatar/#{email_md5}.jpg"
    image_tag gravatar_uri, { :width => 25 }
  end

end
