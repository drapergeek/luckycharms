require 'spec_helper'

describe Admin::Api::BookmarksController do
  describe '#create' do
    before do
      controller.stubs(:authorize_api!)
    end

    it 'will add a bookmarked url' do
      post :create, name: 'my link', url: 'http://awesome.com'

      expect(response).to be_success
      expect(Bookmark.last.name).to eq('my link')
      expect(Bookmark.last.url).to eq('http://awesome.com')
    end

    it 'returns a 403 and the error if the bookmark is invalid' do
      post :create

      expect(response.response_code).to eq(403)
      expect(JSON.parse(response.body)["name"]).to include("can't be blank")
    end
  end
end
