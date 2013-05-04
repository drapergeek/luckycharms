class Admin::Api::CurrentUrlsController < Admin::ApiController

  def create
    unit = Unit.find_by_name(params[:unit_id])
    unit.set_current_url(params[:url])
    render json: :success
  end
end
