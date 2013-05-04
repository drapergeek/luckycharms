class RegistrationsController < ApplicationController
  respond_to :json

  def create
    registration = Registration.new(unit)
    if registration.save
      render json: :success
    else
      render json: registration.errors, status: :forbidden
    end
  end

  private

  def unit_params
    params.permit(:name, :mac_address)
  end

  def unit
    Unit.new(unit_params)
  end
end
