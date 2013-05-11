class Admin::Api::BookmarksController < Admin::ApiController
  def create
    bookmark = Bookmark.new(name: params[:name], url: params[:url])
    if bookmark.save
      render json: :success
    else
      render json: bookmark.errors, status: 403
    end
  end
end
