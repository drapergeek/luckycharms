class Admin::UnitsController < AdminController
  respond_to :html

  def index
    @units = Unit.all
    respond_with @units
  end
end
