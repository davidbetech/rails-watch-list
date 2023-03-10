class BookmarksController < ApplicationController

  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:new]


    def new
      @bookmark = Bookmark.new
    end

    def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    if @bookmark.save
      redirect_to @list
    else
      render :new
    end
    end

    def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy

      redirect_to list_path(@bookmark.list), notice: "bookmark has been destroyed arriba satanas"
    end

    private
    def set_list
      @list = List.find(params[:list_id])
    end

    def bookmark_params
      params.require(:bookmark).permit( :comment, :movie_id)
    end


end
