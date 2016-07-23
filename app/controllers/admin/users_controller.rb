class Admin::UsersController < ApplicationController
  
  def index
  	@users = User.all
  	@user = User.find(session[:user_id])
  	unless @user.is_admin?
  	 redirect_to movies_path, notice: 'Access Denied'
  	end
  end

  def show
  	@user = User.find(session[:user_id])
  	unless @user.is_admin?
  	 redirect_to movies_path, notice: 'Access Denied'
  	end
  end


end
