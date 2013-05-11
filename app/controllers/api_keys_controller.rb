class ApiKeysController < ApplicationController
  respond_to :json

  def show
    if unit.present? && unit.send_new_api_key?
      respond_with unit.reload
    else
      render json: {}, status: :forbidden
    end
  end

  private

  def unit
    @unit ||= Unit.find_by_mac_address(params[:id])
  end
end
