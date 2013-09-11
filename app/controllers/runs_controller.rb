class RunsController < ApplicationController

  def create
    workflow = current_user.workflows.find(params[:workflow_id])
    run = workflow.create_run
    redirect_to run_path(run)
  end

  def show
    run = current_user.workflows.find(params[:workflow_id]).runs.find(params[:id])
    render :show, :locals => { :run => run }
  end

private

  def fake_run
  end

end
