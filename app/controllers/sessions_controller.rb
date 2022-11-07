class SessionsController < ApplicationController
  
    def create
      @user = User.find_by(username: params[:username])
      if !!@user && @user.authenticate(params[:session][:password])
        session[:username] = @user.username
        redirect_to users_path 
      else  
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
    def destroy
      log_out if logged_in?
      redirect_to root_path
    end
  end
  