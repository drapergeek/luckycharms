require 'spec_helper'

describe ApiKeysController do
  describe '#show' do
    context 'when you are allowed to retrieve an API key' do
      it 'returns an api key' do
        unit = create(:unit)
        get :show, id: unit.mac_address

        expect(response).to be_success
        expect(JSON.parse(response.body)["api_key"]).not_to eq("")
      end
    end

    context 'when you are not allowed to retrieve an API key' do
      it 'returns a 403 forbidden' do
        get :show, id: '1'

        expect(response.response_code).to eq(403)
      end
    end
  end
end
