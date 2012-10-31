class Comment < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user
  belongs_to :quest 
  attr_accessible :answer_id, :body, :user_id, :quest_id
  validates :body, :presence => true
  
end
