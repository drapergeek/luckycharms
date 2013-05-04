class Admin::ApiController < ApplicationController
  before_filter :authorize_api!
  protect_from_forgery with: :null_session

  protected

  def authorize_api!
    unless user_authenticated?
      deny_access
    end
  end

  private

  def deny_access
    reset_session
    render json: {}, status: :forbidden
  end

  def user_authenticated?
    if user = User.find_by_api_key(params[:api_key])
      sign_in(user)
    end
  end
end
