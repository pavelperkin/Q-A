class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :quest
  has_many :comments
  attr_accessible :data, :quest_id, :rank, :user_id
  validates :data, :presence => true
end
