require 'digest/md5'

module ApplicationHelper

## flash #####################################################################

  def flash_messages
    render 'layouts/flash', :flash => flash
  end

## users #####################################################################

  def gravatar_for_user(user)
    email_md5 = md5(user.email)
    gravatar_uri = "http://www.gravatar.com/avatar/#{email_md5}.jpg"
    image_tag gravatar_uri, { :width => 25 }
  end

## utility ###################################################################

  def md5(string)
    Digest::MD5.hexdigest(string)
  end

end
