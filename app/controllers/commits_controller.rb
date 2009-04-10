class CommitsController < ApplicationController

  before_filter :parse_parameters

  def index
    @commits = @repository.commits
  end

  def show
    repository = Repository.find(params[:repository_id])
    redirect_to repository_commit_trees_path(repository, params[:id])
  end

private ######################################################################

  def parse_parameters
    @repository = Repository.find(params[:repository_id])
  end
  

end
