class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:profile ,:upload_avatar, :destroy_avatar,:create,:edit_profile]
  before_action :set_post, only: [:destroy_avatar,:upload_avatar,:create,:profile]
  before_action :authorize_user, only: [:destroy_avatar,:create,:upload_avatar]
  def profile
         
        @profile = Profile.new

  end

  def upload_avatar

  	@user.avatar = params[:user][:avatar]
  	@user.save
  	redirect_to request.referrer

  end	

  def destroy_avatar

  	@user.avatar = nil
  	@user.save

  	redirect_to profile_path(current_user.id)


  end	
  def create
  
    @profile = Profile.create(name: params[:profile][:name], number: params[:profile][:number], gender: params[:profile][:gender],college: params[:profile][:college],school: params[:profile][:school],user_id: current_user.id, age: params[:profile][:age], work: params[:profile][:work])
    
    redirect_to profile_path(current_user.id)    


  end
  def edit_profile
  @profile = Profile.find(params[:id])
  if @profile.user.id != current_user.id
      redirect_to root_path
  end  

  end 
  def search
    term = params[:term]

    users = User.where('email like ?', "%#{term}%")

    data = []
    users.each do |u|
      data << {
        id: u.id,
        label: u.email,
        value: u.email
      }
    end

    return render json: data, status: 200


  end
  def update
  @profile = Profile.find(params[:id])
  @profile = Profile.update(name: params[:profile][:name], number: params[:profile][:number], gender: params[:profile][:gender],college: params[:profile][:college],school: params[:profile][:school],user_id: current_user.id, age: params[:profile][:age], work: params[:profile][:work])
  redirect_to profile_path(current_user.id)
  end 
  private

  def set_post
  @user = User.find(params[:id])
  end

  def authorize_user
  if (@user.id != current_user.id)
  redirect_to action: "profile"
  end
  end
end
