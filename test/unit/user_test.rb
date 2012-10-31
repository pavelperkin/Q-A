require 'test_helper'

class UserTest < ActiveSupport::TestCase
   def setup
	@user=User.new
	@user.email='email@mail.com'
	@user.nickname='New User'
	@user.password='newpasword'
	@user.password_confirmation='newpasword'
   end
   
   test "the truth" do
     assert true
   end
   
   test "should save user" do
	  assert @user.save
    end
	
	test 'should not save without email' do
		@user.email=''
		assert !@user.save
	end	
	
	test 'should not save while email is not "xxx@yyy.zzz"' do
	   	@user.email='This_is_not_format'
		assert !@user.save
	end
	
	test 'password should be more than 6 symbols' do
		@user.password='qwe'
		@user.password_confirmation='qwe'
		assert !@user.save
	end
	
	test 'password should be equal password confirmation' do
		@user.password='wrongpassword'
		assert !@user.save
	end	
	
	test 'email should be unique' do
		@user.save
		@newuser=User.new
		@newuser.email='email@mail.com'
		@newuser.nickname='User'
		@newuser.password='newpasword'
		@newuser.password_confirmation='newpasword'
		assert @newuser.save
	end
  
  
end

