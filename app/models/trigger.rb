class Trigger < ActiveRecord::Base

  def self.inheritance_column; "notused"; end

  TYPES = {
    "github" => "Github",
    "heroku" => "Heroku"
  }
  
  TYPE_ICONS = {
    "github" => "icon-github",
    "heroku" => "icon-sign-blank"
  }

  belongs_to :run
  belongs_to :workflow

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
