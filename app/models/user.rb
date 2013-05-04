class User < ActiveRecord::Base
  include Clearance::User
  before_create :create_api_key

  private

  def create_api_key
    self.api_key = SecureRandom.base64
  end
end
