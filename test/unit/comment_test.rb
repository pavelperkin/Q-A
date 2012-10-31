require 'test_helper'

class CommentTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
  
  def setup
     @comment=Comment.new
	 @comment.user_id=1
	 @comment.quest_id=1
	 @comment.answer_id=1
	 @comment.body='My comment'
   end
   
   test 'should not save comment without body' do
	 @comment.body=''
	 assert !@comment.save
   end 
   
   test 'save comment' do	 	 
	 assert @comment.save
   end 
end
