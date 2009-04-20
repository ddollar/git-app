class FilesController < ApplicationController

  tab :repositories => :files

  before_filter :parse_parameters

  def index
    @node = @commit.nodes
    render_partial_for_node
  end

  def show
    @node = @commit.nodes(params[:id])
    render_partial_for_node
  end

private ######################################################################

  def parse_parameters
    @repository = Repository.find_by_name!(params[:repository_id])
    @commit     = @repository.commits(params[:commit_id])
  end

  def render_partial_for_node
    Rails.logger.info @node.inspect
    case @node
      when Git::Tree then render :tree
      when Git::Blob then render :blob
      else raise 'Invalid node'
    end
  end

end
