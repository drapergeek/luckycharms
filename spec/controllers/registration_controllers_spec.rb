require 'spec_helper'

describe RegistrationsController do
  describe '#create' do
    context 'when the unit is not registered' do
      it 'stores the mac address and name' do
        post :create, mac_address: '00:23:23:34:34:34', name: 'itouch 1'

        unit = Unit.last
        expect(unit.mac_address).to eq '00:23:23:34:34:34'
        expect(unit.name).to eq 'itouch 1'
        expect(response).to be_success
      end
    end

    context 'when the unit is already registered' do
      it 'responds with a forbidden and an error' do
        unit = create(:unit)
        post :create, mac_address: unit.mac_address, name: 'itouch2'

        expect(response.response_code).to eq(403)
        expect(JSON.parse(response.body)).to include("Unit is already registered.")
      end
    end

    context 'when the unit registration is not valid' do
      it 'responds with a forbidden and an errors object' do
        post :create

        expect(response.response_code).to eq(403)
        expect(JSON.parse(response.body)).not_to be_empty
      end
    end
  end
end
