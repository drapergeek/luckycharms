class Admin::Api::CurrentUrlsController < Admin::ApiController
  def create
    unit = Unit.find_by_name(params[:unit_id])
    if unit && unit.set_current_url(params[:url])
      render json: :success
    else
      render json: { errors: I18n.t('units.set_current_url.error') }, status: :forbidden
    end
  end
end
