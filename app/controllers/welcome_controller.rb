class WelcomeController < ApplicationController
  def index
  end

  def about
    render about_path
  end
end
