class UsersController < ApplicationController

  before_filter :admin_only!, :except => [:show, :index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
        redirect_to users_path, notice: "User #{@user.username} was succesfully created"
    else
        render action: "new" 
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path, notice: "User #{@user.username} was successfully updated."
    else
      render action: "edit"
    end
  end


  def destroy
    @user = Users.find(params[:id])
    @user.destroy

    redirect_to users_url     
  end
end
