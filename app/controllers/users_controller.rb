class UsersController < ApplicationController
  
  def index
    @users = User.all.order(identifier: :asc)
  end

  def show
    @user = User.find(params[:id])
  end
 

  def new
    @user = User.new
  end

  
  def create
    @user = User.new(user_params)
    if @user.save
    # stores saved user id in a session
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  # The update action (re-)fetches the user from the database,
  #  and attempts to update it with the submitted form data 
  # filtered by info.

  def edit
    @user = User.find(params[:id])
    # if @user.update(info)
    #   redirect_to @user
 
    # else
    #   render :edit, status: :unprocessable_entity
    # end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render ('edit')
    end
  end

  def destroy
    @user = User.find(params[:username])
    @user.destroy
    redirect_to root_path
  end

  def delete
    @user = User.find(param[:id])
  end
    
  private
  def payment
    params.require(:card_no, :cvv, :expire_time, :zip_code);
  end

  def user_params
    params.require(:user).
    permit(:first_name, :last_name, :username, :email, :password);
  end


end
