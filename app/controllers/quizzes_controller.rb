class QuizzesController < ApplicationController
  def show
    @list = List.find(params[:id])
    @words = @list.words.all
    # binding.pry
    @wordz = @words.shuffle
    # binding.pry
  end
  # @wordz.each do |word|
  #   question == word.definition
  #   answer1 == word.name
  #   answer2 == @wordz.name.where(id != word.id)

  # def is_correct?(question, answer)
  #   question.id == answer.id
  # end
end
