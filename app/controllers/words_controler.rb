class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show
    @word = Word.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @word = Word.new
  end
end
