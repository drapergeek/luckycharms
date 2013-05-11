class Bookmark < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true

  def self.find_by_id_or_name(id_or_name)
    find_by_id(id_or_name) || find_by_name(id_or_name)
  end
end
