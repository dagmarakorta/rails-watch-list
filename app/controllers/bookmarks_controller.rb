class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @bookmark.list = @list
  end

  def create
    @bookmark = Bookmark.new(params_require)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    @list = @bookmark.list_id
    redirect_to list_path(@list), status: :see_other
  end

  private

  def params_require
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
