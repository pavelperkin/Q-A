require 'test_helper'

class QuestTest < ActiveSupport::TestCase
   
   def setup
     @quest=Quest.new
	 @quest.user_id=1
	 @quest.theme='My theme'
	 @quest.tags='My tags'
	 @quest.body='My question'
   end
   
      
   test 'should not save quest without theme' do
	 @quest.theme=''
	 assert !@quest.save
   end 	
   
   test 'should not save quest without tags' do
	 @quest.tags=''	 
	 assert !@quest.save
   end 
   
   test 'should not save quest without body' do
	 @quest.body=''
	 assert !@quest.save
   end 
   
   test 'save quest' do	 	 
	 assert @quest.save
   end 
end
