class SessionsController < ApplicationController

  def new
    @user= User.new
  end


  def create
    @user = User.find_by(email: params[:session][:email])
    # finds existing user, checks to see if user can be authenticated
    if @user.present? && @user.authenticate(params[:session][:password])
    # sets up user.id sessions
      # session[:user_id] = @user.id
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  

end
  