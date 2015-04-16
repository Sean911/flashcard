class ListsController < ApplicationController

  def index
    @lists = List.all
    # if !current_user.nil?
    #   @lists = List.where(user_id: [nil, "", current_user.id])
    # else
    #   @lists = List.where(user_id: [nil, ""])
    # end
  end

  def show
    @list = List.find(params[:id])
    @words = @list.words.all
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)

    if @list.save
      flash[:notice] = "List created!"
      redirect_to @list
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    if current_user.id == list.user_id
      @list.destroy
      flash[:notice] = "List deleted!"
      redirect_to lists_path
    else
      flash[:notice] = "You can't delete someone else's list!"
      render :show
    end
  end

  private

  def list_params
    params.require(:list).permit(
      :name, :user_id
      )
  end
end
