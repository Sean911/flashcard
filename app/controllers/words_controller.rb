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

  def create
    @list = List.find(params[:list_id])
    @word = @list.words.new(word_params)
    if @word.save
      flash[:notice] = "Word added!"
      redirect_to list_path(@list)
    else
      render :new
    end
  end


  def destroy
    @list = List.find(params[:list_id])
    @word = Word.find(params[:id])

    if @word.list.user_id == current_user.id
      @word.destroy
      flash[:notice] = "Word removed!"
      redirect_to list_path(@list)
    end
  end

  private

  def word_params
    params.require(:word).permit(:name, :definition, :list_id)
  end
end
