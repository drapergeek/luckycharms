class Admin::UnitsController < AdminController
  respond_to :html, :json

  def index
    @units = Unit.all
    respond_with @units
  end
end
