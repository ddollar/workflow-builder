class WorkflowsController < ApplicationController

  before_filter :ensure_authenticated!

  def index
    workflows = current_user.workflows
    render :index, :locals => { :workflows => workflows }
  end

  def new
    render :edit, :locals => { :workflow => current_user.workflows.new }
  end

  def create
    render :text => params[:workflow].inspect
  end

  def show
    workflow = current_user.workflows.find(params[:id])
    render :show, :locals => { :workflow => workflow }
  end

  def edit
    workflow = current_user.workflows.find(params[:id])
    render :edit, :locals => { :workflow => workflow }
  end

  def update
    render :text => params[:workflow].inspect
  end

end
