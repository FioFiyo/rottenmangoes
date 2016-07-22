class AdminController < ApplicationController
  

  def new
  end

  def create
  	if current_user && current_user.is_admin?
  	#give option to user admin view
  	#see all users

  	end 
  end

end
