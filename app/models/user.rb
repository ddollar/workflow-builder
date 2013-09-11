class User < ActiveRecord::Base

  has_many :workflows

  attr_accessible :github_token
  attr_accessible :uid

  after_create :seed_fake_data

  def github
    return nil unless self.github_token.present?
    @github ||= Github.new(:oauth_token => self.github_token)
  end

private

  def seed_fake_data
    workflow = self.workflows.new(:name => "Workflow App to Production")
    workflow.trigger = Trigger.new(:type => "github", :args => { :repository => "ddollar/workflow", :branch => "master" })
    workflow.steps << Step.new(:num => 1, :type => "heroku-release", :args => { :app => "wf-staging" })
    workflow.steps << Step.new(:num => 2, :type => "heroku-run", :args => { :app => "wf-staging", :command => "bundle exec rake db:migrate" })
    workflow.steps << Step.new(:num => 3, :type => "heroku-run", :args => { :app => "wf-staging", :command => "bundle exec rake spec" })
    workflow.steps << Step.new(:num => 4, :type => "check-http", :args => { :url => "https://wf-staging.herokuapp.com/check", :status => "200", :content => "ok" })
    workflow.steps << Step.new(:num => 5, :type => "heroku-release", :args => { :app => "wf-production" })
    workflow.steps << Step.new(:num => 6, :type => "heroku-run", :args => { :app => "wf-production", :command => "bundle exec rake db:migrate" })
    workflow.steps << Step.new(:num => 7, :type => "check-http", :args => { :url => "https://wf-production.herokuapp.com/check", :status => "200", :content => "ok" })
    workflow.notification = Notification.new(:type => "campfire", :args => { :room => "HerokaiLounge" })
    workflow.save

    run = workflow.create_run
    run.update_attributes :state => "success", :started_at => 11.minutes.ago, :finished_at => 9.minutes.ago
    run.steps.each_with_index do |step, idx|
      step.status = case idx
        when 0..3 then "success"
        when 4    then "running"
        else           ""
      end
      step.save
    end
  end

end
