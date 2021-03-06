require 'spec_helper'

describe CurrentUrlsController do
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe '#show' do
    context 'when the api_key is for a unit' do
      it 'returns the current_url for the unit' do
        unit = create(:unit, api_key: '12312312312', current_url: 'http://blah.com')
        get :show, unit_id: unit.api_key

        expect(JSON.parse(response.body)["current_url"]).to eq('http://blah.com')
        expect(Unit.last.last_checked_in_at).to be_within(1.minute).of(Time.now)
      end
    end

    context 'when the api_key is not found' do
      it 'returns a forbidden' do
        get :show, unit_id: 'bljklsdfdsfj'

        expect(response.response_code).to eq(403)
      end
    end
  end
end
