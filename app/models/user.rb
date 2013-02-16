class User < ActiveRecord::Base
  attr_accessible :logcount, :name, :password

  validates :name,  presence: true, length: { maximum: 128 }
  validates :password, length: { maximum: 128 }
  validates :logcount, :numericality => { :greater_than_or_equal_to => 1 }
  


	SUCCESS               =   1  # : a success
	ERR_BAD_CREDENTIALS   =  -1  # : (for login only) cannot find the user/password pair in the database
	ERR_USER_EXISTS       =  -2  # : (for add only) trying to add a user that already exists
	ERR_BAD_USERNAME      =  -3  # :
	ERR_BAD_PASSWORD      =  -4

      def self.addUser(username,password)
        @checkUser = User.where(:name => username)
        if !@checkUser.blank?
          return ERR_USER_EXISTS
        elsif username == "" || username.length > 128
          return ERR_BAD_USERNAME
        elsif username.length > 128
          return ERR_BAD_USERNAME
        elsif password.length > 128
          return ERR_BAD_PASSWORD
        else	
          User.create(:name=>username,:password=>password,:logcount=>1)  
          return 1
        end
      end      

      def self.loginUser(username,password)
        @checkUser = User.where(:name=>username,:password=>password).first
        if !@checkUser.blank?
          num = @checkUser.logcount + 1
          @checkUser.update_attributes(:logcount=>num)
          return 1
        else
          return -1
        end
      end

      def self.TESTAPI_resetFixture
        for user in User.all
          User.destroy(user)
        end  
      end

      def self.TESTAPI_unitTests
        #fill in method here later
      end

end
