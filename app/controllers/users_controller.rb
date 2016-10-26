class UsersController < ApplicationController
  
  before_action :require_logout, only: [:new]
  before_action :require_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/'
    else
      render 'new'
    end
  end
    
  def show
  end
  
	def update
    attributes = user_params.clone
 		@user = current_user
    @user.update_attributes(attributes)
   	redirect_to '/profile'
 	end 

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end 
  
end
