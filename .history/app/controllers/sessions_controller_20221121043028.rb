class SessionsController < ApplicationController

  def new
    @user= User.new
  end


  def create
    @user = User.find_by(email: params[:session][:email])
    # finds existing user, checks to see if user can be authenticated
    if @user.present? && @user.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        
        redirect_back_or @user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_path
      end
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
  