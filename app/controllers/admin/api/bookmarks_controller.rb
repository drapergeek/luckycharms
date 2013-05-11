class Admin::Api::BookmarksController < Admin::ApiController
  respond_to :json

  def index
    bookmarks = Bookmark.all.order(:name)
    respond_with(bookmarks)
  end

  def create
    bookmark = Bookmark.new(name: params[:name], url: params[:url])
    respond_with(bookmark, location: nil) do
      bookmark.save
    end
  end
end
