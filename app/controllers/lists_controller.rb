class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @words = @list.words.all
  end

  def new
    @list = List.new
  end
end
