class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) #we saw in Section 6.1.4. (Technically, params[:id] is the string "1", but find is smart enough to convert this to an integer.)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      #Handle a successful save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  
end
