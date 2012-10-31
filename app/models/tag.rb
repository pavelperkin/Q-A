class Tag < ActiveRecord::Base
  attr_accessible :body, :rank
  validates :body, :presence => true
end
