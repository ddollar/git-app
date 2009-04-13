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
    @repository = Repository.find(params[:repository_id])
    @commit     = @repository.commits(params[:commit_id])
  end

  def render_partial_for_node
    Rails.logger.info @node.inspect
    case @node
      when Tree then render :tree
      when Blob then render :blob
      else raise 'Invalid node'
    end
  end

end
