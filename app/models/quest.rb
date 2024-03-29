class Quest < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments
  attr_accessible :answers_c, :body, :comments_c, :likes, :tags, :theme, :user_id, :review_c
  
  validates :body, :presence => true
  validates :theme, :presence => true
  validates :tags, :presence => true
end
