class Registration
  include ActiveModel::Model
  delegate :save, to: :unit

  def initialize(unit)
    @unit = unit
  end

  def errors
    if unit_already_registered?
      ["Unit is already registered."]
    else
      unit.errors
    end
  end

  private
  attr_reader :unit

  def unit_already_registered?
    unit.errors.has_key?(:mac_address) &&
      unit.errors[:mac_address].include?("has already been taken")
  end
end
