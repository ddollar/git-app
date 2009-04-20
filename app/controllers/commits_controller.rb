class CommitsController < ApplicationController

  tab :repositories => :commits

  before_filter :parse_parameters

  def index
    @commits = @repository.commits
  end

  def show
    repository = Repository.find_by_name!(params[:repository_id])
    redirect_to repository_commit_diff_path(repository, params[:id])
  end

private ######################################################################

  def parse_parameters
    @repository = Repository.find_by_name!(params[:repository_id])
  end
  

end
