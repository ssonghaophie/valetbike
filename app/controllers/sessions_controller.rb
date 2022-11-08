class SessionsController < ApplicationController
  
  def new
  end

  # def create
  #   user = User.find_by(email: params[:session][:email])
  #   if user 
  #     session[:user_id] =  user.id  
  #     redirect_to user
  #   else 
  #     flash[:danger] = 'Invalid email/password combination'
    
  #   end
  # end

  # def destroy
  # end
  def create
    @user = User.find_by(email: params[:session][:email])
    # finds existing user, checks to see if user can be authenticated
    if @user.present? && @user.authenticate(params[:session][:password])
    # sets up user.id sessions
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end


end
  