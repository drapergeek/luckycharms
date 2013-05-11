require 'spec_helper'

describe Admin::UnitsController do
  before do
    controller.stubs(:authorize_api!)
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe "#index" do
    it 'will return a list of units' do
      create(:unit, name: 'hallway')
      create(:unit, name: 'front desk')

      get :index

      units = JSON.parse(response.body)
      expect(units[0]["name"]).to eq('hallway')
      expect(units[1]["name"]).to eq('front desk')
    end
  end
end
