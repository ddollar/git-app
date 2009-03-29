class UsersController < ApplicationController

  tab :users

  def index
    @users = User.all
  end

end
