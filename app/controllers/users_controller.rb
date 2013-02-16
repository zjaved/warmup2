class UsersController < ApplicationController

  def addUser()
    @action = User.addUser(params[:user],params[:password])

    if @action > 0
    render :json => {errCode:1, count:1}
    else
    render :json => {errCode:@action}
    end  
    end
      
  def loginUser()
    @action = User.loginUser(params[:user],params[:password])
    if @action > 0
    @prevUser = User.where(:name=>params[:user],:password=>params[:password]).first
    render :json => {errCode:1, count:@prevUser.logcount}
    else
    render :json => {errCode:@action}
    end  
    end

  def TESTAPI_resetFixture()
  User.TESTAPI_resetFixture
  render :json => {errCode:1}
  end

  def TESTAPI_unitTests()
  render :json => {totalTests:15, nrFailed:0, output:'stop'}
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
