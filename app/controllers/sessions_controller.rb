class SessionsController < ApplicationController

  def create
    session[:user] = User.first
    redirect_to :back
  end

  def destroy
    session[:user] = nil
    redirect_to :back
  end

end
