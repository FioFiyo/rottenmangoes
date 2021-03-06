class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      session[:user_id] = @user.id
  		redirect_to movies_path, notice: "Welcome aboard #{@user.first_name}!"
  	else
  		render :new
  	end
  end

  protected
  
  def user_params
  	params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end

end
