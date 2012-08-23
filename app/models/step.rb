class Step < ActiveRecord::Base

  TYPES = {
    "heroku-release" => "Release",
    "heroku-run"     => "Run",
    "check-http"     => "Check URL",
    #"custom-script"  => "Custom"
  }

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

end
