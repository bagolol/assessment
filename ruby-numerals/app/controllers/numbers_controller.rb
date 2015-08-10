class NumbersController < ApplicationController


  def index

  end

  def create
    @number = Number.new params[:number]
    cookies[:number] = "one"
    redirect_to '/numbers'
  end
end
