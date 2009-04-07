class RepositoriesController < ApplicationController

  tab :repositories

  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def create
    @repository = Repository.new(params[:repository])
    if @repository.save
      flash[:success] = 'Repository created.'
      redirect_to repositories_path
    else
      render :edit
    end
  end

  def edit
    @repository = Repository.find_by_path!(params[:id])
  end

  def update
    @repository = Repository.find_by_path!(params[:id])
    if @repository.update_attributes(params[:repository])
      flash[:success] = 'Repository updated.'
      redirect_to repositories_path
    else
      render :edit
    end
  end

end
