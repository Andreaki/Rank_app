class SessionsController < ApplicationController
  def login
	 
  end
  def login_attempt
	authorized_user=User.authenticate(params[:name],params[:password])
        if authorized_user
            flash[:notice] = "welcome, you logged as #{authorized_user.name}"
            render :action => 'login'
       else
	  flash[:notice] ="Invalid Username or Password"
          flash[:color]="invalid"
          render "login"
       end
  end
end     
