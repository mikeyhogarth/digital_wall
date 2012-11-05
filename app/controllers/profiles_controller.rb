class ProfilesController < ApplicationController

  before_filter :only_this_user_or_admin_may_edit!

  def new
    
    @user = User.find(params[:user_id])
    
    if(@user.has_profile?)
      redirect_to edit_user_profile_path(@user, @user.profile)
    end
    
    @profile = Profile.new
  end


  def edit
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end


  def create
    @user = User.find(params[:user_id])
    
    @profile = Profile.new(params[:profile])
    @user.profile = @profile

    if @profile.save
      redirect_to root_url, notice: 'Profile was successfully created.'
    else
      render action: "new"
    end
  end


  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      redirect_to root_path, notice: 'Profile was successfully updated.'
    else
      render action: "edit"
    end
  end

  private
  def only_this_user_or_admin_may_edit!
    unless(current_user.id == params[:user_id].to_i or current_user.administrator?)
      redirect_to root_url
    end
  end
  
end
