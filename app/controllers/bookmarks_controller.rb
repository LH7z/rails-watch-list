class BookmarksController < ApplicationController
  def index
    @bookmark = Bookmark.all
  end
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end
  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_bookmarks_path, notice: "bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_bookmarks_path(@list), notice: "Garden was successfully destroyed."
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
