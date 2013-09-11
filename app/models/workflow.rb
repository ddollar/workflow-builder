class Workflow < ActiveRecord::Base

  attr_accessible :name

  has_one  :notification
  has_many :runs
  has_many :steps
  has_one  :trigger

  def create_run
    run = self.runs.new
    run.state = "pending"
    run.trigger = Trigger.new(:args => self.trigger.args, :type => self.trigger.type)
    self.steps.each do |step|
      run.steps << Step.new(:args => step.args, :num => step.num, :type => step.type)
    end
    run.notification = Notification.new(:args => self.notification.args, :type => self.notification.type)
    run.save!
    run
  end

  def latest_run
    self.runs.find(:first, :order => "finished_at DESC")
  end

end
