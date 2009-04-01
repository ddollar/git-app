class UsersController < ApplicationController

  tab :users

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = 'User created.'
      redirect_to users_path
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = 'User updated.'
      redirect_to users_path
    else
      render :edit
    end
  end

end
