class Run < ActiveRecord::Base

  attr_accessible :state
  attr_accessible :started_at
  attr_accessible :finished_at

  has_one    :notification
  has_many   :steps
  has_one    :trigger
  belongs_to :workflow

  def duration
    finished_at - started_at
  end

end
