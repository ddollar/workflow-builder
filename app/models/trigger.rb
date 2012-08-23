class Trigger < ActiveRecord::Base

  TYPES = {
    "github" => "Github",
    "heroku" => "Heroku"
  }

  attr_accessible :args
  attr_accessible :num
  attr_accessible :type

  def args
    (JSON.load(self.args_raw) rescue nil) || {}
  end

  def args=(args)
    self.args_raw = JSON.dump(args)
  end
  attr_accessible :args_raw, :num, :type

end
