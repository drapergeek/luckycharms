require 'spec_helper'

describe Admin::Api::BookmarksController do
  describe '#create' do
    context 'with a valid user' do
      before do
        controller.stubs(:authorize_api!)
      end

      it 'will add a bookmarked url' do
        post :create, name: 'my link', url: 'http://awesome.com'

        expect(response).to be_success
        expect(Bookmark.last.name).to eq('my link')
        expect(Bookmark.last.url).to eq('http://awesome.com')
      end
    end
  end
end
