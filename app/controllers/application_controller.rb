class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def verify_user_signed_in
    binding.pry

    unless signed_in?
      render json: {}, status_code: :forbidden
    end
  end
end
