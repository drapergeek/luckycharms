class CurrentUrlsController < ApplicationController
  respond_to :json

  def show
    if unit
      unit.check_in
      respond_with unit.reload
    else
      render json: {}, status: 403
    end
  end

  private

  def unit
    @unit ||= Unit.find_by_api_key(params[:unit_id])
  end
end
