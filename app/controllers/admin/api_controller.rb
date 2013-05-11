class Admin::ApiController < ApplicationController
  before_filter :authorize_api!

  protected

  def authorize_api!
    if user = User.find_by_api_key(params[:api_key])
      sign_in(user)
    else
      reset_session
      render json: {}, status: :forbidden
    end
  end
end
