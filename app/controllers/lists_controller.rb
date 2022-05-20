class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    set_list
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_require)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def params_require
    params.require(:list).permit(:name)
  end
end
