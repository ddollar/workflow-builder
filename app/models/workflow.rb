class Workflow < ActiveRecord::Base

  attr_accessible :name

  has_many :steps
  has_one  :trigger

end
