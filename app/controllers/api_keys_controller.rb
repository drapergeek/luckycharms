class ApiKeysController < ApplicationController
  respond_to :json

  def show
    unit = Unit.find_by_mac_address(params[:id])
    if unit.present? && unit.send_new_api_key?
      render json: { api_key: unit.generate_api_key }
    else
      render json: {}, status: :forbidden
    end
  end
end
