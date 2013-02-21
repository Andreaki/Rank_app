class SessionsController < ApplicationController
  def login
	# Login Form  
  end
  def login_attempt
	authorized_user=User.authenticate(params[:name],params[:password])
        if authorized_user
            flash[:notice] = "welcome, you logged as #{authorized_user.name}"
            redirect_to(:action =>'login')
       else
	  flash[:notice] ="Invalid Username or Password"
          flash[:color]="invalid"
          render "login"
       end
  end
end     
