require 'test_helper'

class TagTest < ActiveSupport::TestCase
   #test "the truth" do
   #  assert true
   #end
   
   def setup
    @tag=Tag.new
    @tag.body='My tag'
   end
   
   test 'should not save tag without body' do
	@tag.body=''
	assert !@tag.save
   end
   
   test 'should save tag' do
	assert @tag.save   
   end
   
   
   
   
end
