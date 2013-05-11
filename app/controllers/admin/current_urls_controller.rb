class Admin::CurrentUrlsController < AdminController
  respond_to :json

  def create
    unit = Unit.find_by_name(params[:unit_id])
    if unit && unit.set_current_url(params[:url])
      respond_with unit, location: nil
    else
      render json: { errors: I18n.t('units.set_current_url.error') }, status: 422
    end
  end
end
