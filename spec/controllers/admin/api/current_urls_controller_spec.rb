require 'spec_helper'

describe Admin::Api::CurrentUrlsController do
  describe '#create' do
    context 'when the user is not authenticated' do
      it 'responds with a forbidden' do
        post :create, unit_id: 1

        expect(response.response_code).to eq(403)
      end
    end

    it 'will update the current_url for the given unit' do
      user = create(:user)
      unit = create(:unit)

      post :create, unit_id: unit.name, api_key: user.api_key, url: 'http://awesome.com'

      expect(response).to be_success
      expect(Unit.last.current_url).to eq('http://awesome.com')
    end
  end
end
