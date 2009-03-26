# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def flash_messages
    render 'layouts/flash', :flash => flash
  end

end
