class NumbersController < ApplicationController


  def index
  end

  def create
    id = params[:number][:number]
    redirect_to :action => "show", :id => id
  end

  def show
    value = params[:id].to_i
    info = { :number => value }
    @number = Number.new info
    @letters = params[:id]
  end
end
