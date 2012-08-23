class Workflow < ActiveRecord::Base

  attr_accessible :name
  attr_accessible :trigger
  attr_accessible :trigger_args

end
