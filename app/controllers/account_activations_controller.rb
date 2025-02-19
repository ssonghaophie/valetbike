class AccountActivationsController < ApplicationController
    def edit
        user = User.find_by(id: params[:id])
        if user && !user.activated?
          user.activate
          log_in user
          flash[:success] = "Account activated!"
          redirect_to user
        else
          flash[:danger] = "Invalid activation link"
          redirect_to root_path
        end
      end
end
