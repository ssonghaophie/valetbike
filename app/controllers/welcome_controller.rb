class WelcomeController < ApplicationController
  def index
  end

  def about
    render('about')
  end
end
