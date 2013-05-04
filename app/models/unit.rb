class Unit < ActiveRecord::Base
  validates :mac_address, uniqueness: true, presence: true
end
