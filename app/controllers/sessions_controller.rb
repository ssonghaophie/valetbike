class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user 
      session[:user_id] =  user.id  
      redirect_to user
    else 
      flash[:danger] = 'Invalid email/password combination'
    
    end
  end

  def destroy
  end


end
  