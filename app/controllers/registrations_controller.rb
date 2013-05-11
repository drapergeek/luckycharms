class RegistrationsController < ApplicationController
  respond_to :json

  def create
    registration = Registration.new(unit)

    respond_with(registration, location: nil) do
      registration.save
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
