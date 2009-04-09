class TreesController < ApplicationController

  tab :repositories => :trees

  before_filter :find_repository

  def index
    redirect_to repository_tree_path(@repository, 'master')
  end

  def show
    @tree = @repository.tree(params[:id])
  end

private ######################################################################

  def find_repository
    @repository = Repository.find(params[:repository_id])
  end

end
