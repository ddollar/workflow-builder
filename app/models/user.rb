class User < ActiveRecord::Base

  has_many :workflows

  attr_accessible :uid

end
