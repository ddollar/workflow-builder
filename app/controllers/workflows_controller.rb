class WorkflowsController < ApplicationController

  before_filter :ensure_authenticated!

  def index
    @workflows = current_user.workflows
    render :index
  end

  def new
    @workflow = current_user.workflows.new
    render :new
  end

private

  def workflows
    @workflows ||= current_user.workflows
  end

end
