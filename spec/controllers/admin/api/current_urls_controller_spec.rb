require 'spec_helper'

describe Admin::Api::CurrentUrlsController do
  describe '#create' do
    context 'when the user is not authenticated' do
      it 'responds with a forbidden' do
        post :create, unit_id: 1

        expect(response.response_code).to eq(403)
      end
    end

    context 'with a valid user' do
      before do
        controller.stubs(:authorize_api!)
      end

      it 'will update the current_url for the given unit' do
        unit = create(:unit)

        post :create, unit_id: unit.name, url: 'http://awesome.com'

        expect(response).to be_success
        expect(Unit.last.current_url).to eq('http://awesome.com')
      end

      context 'when given a bookmark that does not exist' do
        it 'will return 403 and an error message' do
          unit = create(:unit)
          post :create, unit_id: unit.name, url: 'my link'

          expect(response.response_code).to eq(403)
          expect(JSON.parse(response.body)["errors"]).to eq("The unit's url was not changed, please be sure that you provided a valid unit and boomark.")
        end
      end
    end
  end
end
