class UsersController < ApplicationController
  
  def index
    @users = User.all.order(identifier: :asc)
  end

  def show
    @user = User.find(params[:username])
  end

  def new 
    @user = User.new
  end

  def signup
    @user = User.new(first_name:"...",
                    last_name:"...",
                    username:"...",
                    password:"...", 
                    email:"...")
    if @user.save
      redirect to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @user = User.find_bu(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
        session[:username] = @username
        redirect_to root
    else
      message ="nooo"
      redirect_to login_path, notice: message 
    end 
  end

  # The edit action fetches the article from the database,
  #  and stores it in @article so that it can be used when building the form. 
  def edit
    @user = User.find(params[:username])
  end
  
  # The update action (re-)fetches the user from the database,
  #  and attempts to update it with the submitted form data 
  # filtered by info.

  def update_info
    @user = User.find(params[:username])
    if @user.update(info)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_payment
    @user = User.find(params[:username])
    if @user.update(payment)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = Users.find(params[:username])
    @user.destroy
    redirect_to root_path, status: :see_other
  end


    
  private
  def payment
    params.require(:card_no, :cvv, :expire_time, :zip_code);
  end

  def info
    params.require(:first_name, :last_name, :password, :email)
          .permit(:username);
  end


end
