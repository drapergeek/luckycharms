class Admin::Api::BookmarksController < Admin::ApiController
  def index
    bookmarks = Bookmark.all.order(:name)
    render json: bookmarks
  end

  def create
    bookmark = Bookmark.new(name: params[:name], url: params[:url])
    if bookmark.save
      render json: :success
    else
      render json: bookmark.errors, status: 403
    end
  end
end
