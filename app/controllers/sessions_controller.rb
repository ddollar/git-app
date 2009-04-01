class SessionsController < ApplicationController

  def create
    params[:session] ||= {}
    session[:user] = User.authenticate(params[:session][:email], params[:session][:password])
    flash[:error] = 'Invalid Login' unless current_user
    redirect_to :back
  end

  def destroy
    session[:user] = nil
    redirect_to :back
  end

end
