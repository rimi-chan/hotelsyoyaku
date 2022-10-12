
class UsersController < ApplicationController
  before_action :authenticate_user!
   
  def account
    @user = current_user
  end
  
  def profile
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:username, :profile_image_id, :introduction))
      flash[:notice] = "updated your profile"
      redirect_to users_profile_url
    else
      render "profile"
    end
    
  
  end
    
  
end