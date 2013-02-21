class UsersController < ApplicationController
  def new
	@user = User.new
  end

  def create 
        @user=User.new(params[:user])
		if @user.save
		flash.keep[:notice]="You signed up successfully"
		flash[:color]="valid"
	else
		flash.keep[:notice]= "Form is valid"
		flash[:color]="invalid"
	end
     #render "new" 
   end
end

