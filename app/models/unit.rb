class Unit < ActiveRecord::Base
  validates :mac_address, uniqueness: true, presence: true

  def send_new_api_key?
    api_key.blank?
  end

  def generate_api_key
    if send_new_api_key?
      create_api_key
      api_key
    end
  end


  private

  def create_api_key
    self.update_attribute(:api_key, SecureRandom.base64)
  end
end
