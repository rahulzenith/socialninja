class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:profile ,:upload_avatar, :destroy_avatar]
  def profile
     
       	@user = User.find(params[:id])

  end

  def upload_avatar

  	@user = User.find(params[:id])
  	@user.avatar = params[:user][:avatar]
  	@user.save
  	redirect_to request.referrer

  end	

  def destroy_avatar

  	@user = User.find(params[:id])
  	@user.avatar = nil
  	@user.save

  	redirect_to profile_path


  end	
end
