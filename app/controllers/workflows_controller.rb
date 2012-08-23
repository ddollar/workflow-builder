class WorkflowsController < ApplicationController

  before_filter :ensure_authenticated!

  def index
    @workflows = current_user.workflows
    render :index
  end

  def new
    workflow = current_user.workflows.new
    render :workflow, :locals => { :workflow => workflow }
  end

  def show
    workflow = current_user.workflows.new(:name => "Workflow App to Production")

    workflow.steps << Step.new(:num => 1, :type => "heroku-release", :args => { :app => "wf-staging" })
    workflow.steps << Step.new(:num => 2, :type => "heroku-run", :args => { :app => "wf-staging", :command => "bundle exec rake db:migrate" })
    workflow.steps << Step.new(:num => 3, :type => "heroku-run", :args => { :app => "wf-staging", :command => "bundle exec rake spec" })
    workflow.steps << Step.new(:num => 4, :type => "check-http", :args => { :url => "https://wf-staging.herokuapp.com/check", :status => "200", :content => "ok" })
    workflow.steps << Step.new(:num => 5, :type => "heroku-release", :args => { :app => "wf-production" })
    workflow.steps << Step.new(:num => 6, :type => "heroku-run", :args => { :app => "wf-production", :command => "bundle exec rake db:migrate" })
    workflow.steps << Step.new(:num => 7, :type => "check-http", :args => { :url => "https://wf-production.herokuapp.com/check", :status => "200", :content => "ok" })

    render :workflow, :locals => { :workflow => workflow }
  end

private

  def workflows
    @workflows ||= current_user.workflows
  end

end
