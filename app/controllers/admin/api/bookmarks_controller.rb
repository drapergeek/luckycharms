class Admin::Api::BookmarksController < Admin::ApiController
  def create
    Bookmark.create(name: params[:name], url: params[:url])
    render json: :success
  end
end
