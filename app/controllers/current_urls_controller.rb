class CurrentUrlsController < ApplicationController
  def show
    if unit
      unit.check_in
      render json: { current_url: unit.current_url }
    else
      render json: {}, status: 403
    end
  end

  private

  def unit
    @unit ||= Unit.find_by_api_key(params[:unit_id])
  end
end
