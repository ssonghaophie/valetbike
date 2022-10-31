class UsersController < ApplicationController
  
    def index
      @users = User.all.order(identifier: :asc)
    end
    
  end
  