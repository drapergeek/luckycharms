require 'spec_helper'

describe Registration do
  context 'when a unit is already registered' do
    it 'returns a custom error' do
      unit = stub(save: false, errors: { mac_address: 'has already been taken' })
      registration = Registration.new(unit)

      expect(registration.save).to be_false
      expect(registration.errors).to eq(['Unit is already registered.'])
    end
  end

  context 'when a unit is not already registered' do
    it 'returns the errors from the unit' do
      unit = stub(save: false, errors: { name: 'is not awesome' })
      registration = Registration.new(unit)

      expect(registration.errors).to eq(unit.errors)
    end
  end
end
