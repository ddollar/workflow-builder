class Document < ActiveRecord::Base
  attr_accessible :name, :user_id, :uuid
end
