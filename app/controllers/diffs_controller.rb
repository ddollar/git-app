class DiffsController < ApplicationController

  before_filter :parse_parameters

  def show
    @diffs = @commit.diffs
  end

private ######################################################################

  def parse_parameters
    @repository = Repository.find_by_name!(params[:repository_id])
    @commit     = @repository.commits(params[:commit_id])
  end

end