#rails unit tests here

require 'spec_helper'
require 'rspec-rails'
require 'user'

describe User do 
	describe "#addUser" do
		it "test1" do
			User.addUser('user','password')
			userNew = User.where(:name=>'user',:password=>'password').first
			userNew.password.should eql "password"
			end
		it "test2" do
			User.addUser('user','password')
			userNew = User.where(:name=>'user',:password=>'password').first
			userNew.name.should eql "user"
			end
		it "test3" do
			User.addUser('user1','')
			User.addUser('user2','') 
			userList = User.all
			userList.size.should eql 2
			end
		it "test4" do
			User.addUser('','password')
			userList = User.all
			userList.size.should eql 0
			end
		it "test5" do
			User.addUser('user','password1')
			User.addUser('user','password2') #doesn't work
			userList = User.all
			userList.size.should eql 1
			end
		it "pass_test" do
			User.addUser('user','passwordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpassword') #doesn't work
			userList = User.all
			userList.size.should eql 0
			end
			end
		it "user_test" do
			User.addUser('useruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruseruser','password') #doesn't work
			userList = User.all
			userList.size.should eql 0
			end
	describe "#loginUser" do
		it "valid1" do
			User.addUser('user','password')
			User.loginUser('user','password')
			userNew = User.where(:name=>'user').first
			userNew.logcount.should eql 2
			end
		it "prevent1" do
			User.loginUser('user','password') #doesn't work
			User.addUser('user','password')
			userNew = User.where(:name=>'user').first
			userNew.logcount.should eql 1
			end
		it "count1" do
			User.addUser('user','password')
			User.loginUser('user','password')
			User.loginUser('user','password')
			userNew = User.where(:name=>'user').first
			userNew.logcount.should eql 3
			end
			end
	describe "#TESTAPI_resetFixture" do
		it "db_clear" do
			User.addUser('user1','password1')
			User.addUser('user2','password2')
			User.TESTAPI_resetFixture
			userList = User.all
			userList.size.should eql 0
			end
			end
			end



