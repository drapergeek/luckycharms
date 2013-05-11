class Admin::BookmarksController < AdminController
  respond_to :json, :html

  def index
    @bookmarks = Bookmark.all.order(:name)
    respond_with @bookmarks
  end

  def create
    bookmark = Bookmark.new(name: params[:name], url: params[:url])
    respond_with(bookmark, location: nil) do
      bookmark.save
    end
  end
end
