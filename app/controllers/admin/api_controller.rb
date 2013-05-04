class Admin::ApiController < ApplicationController
  before_filter :verify_user_signed_in

  protected
  def verify_user_signed_in
    binding.pry

    unless signed_in?
      render json: {}, status_code: :forbidden
    end
  end
end

