class WelcomeController < ApplicationController
  def index
  end

  def about
    render('about')
  end
  def service
    render('service')
  end
end
