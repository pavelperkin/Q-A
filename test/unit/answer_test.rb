require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
   
   def setup
     @answer=Answer.new
	 @answer.user_id=1
	 @answer.quest_id=1
	 @answer.data='My answer'
   end
   
   test 'should not save answer without data' do
	 @answer.data=''
	 assert !@answer.save
   end 
   
   test 'save answer' do	 	 
	 assert @answer.save
   end 
   
end
