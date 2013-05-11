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

  def check_in
    self.update_attribute(:last_checked_in_at, Time.now)
  end

  def set_current_url(new_url)
    if is_url?(new_url)
      self.update_attribute(:current_url, new_url)
    else
      bookmark = Bookmark.find_by_name(new_url)
      if bookmark
        self.update_attribute(:current_url, bookmark.url)
      else
        false
      end
    end
  end

  private

  def is_url?(new_url)
    new_url.start_with?("http")
  end

  def create_api_key
    self.update_attribute(:api_key, SecureRandom.base64)
  end
end
