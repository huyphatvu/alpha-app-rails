class WelcomeController < ApplicationController
  def myIndex
    render 'welcomes/myIndex'
  end

  def about
    render 'welcomes/about'
  end
end