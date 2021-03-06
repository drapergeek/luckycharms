require 'spec_helper'

describe Unit do
  it { should validate_uniqueness_of(:mac_address) }
  it { should validate_presence_of(:mac_address) }

  describe '#send_new_api_key?' do
    context 'when the api key is blank' do
      it 'is true' do
        unit = build_stubbed(:unit, api_key: '')
        expect(unit.send_new_api_key?).to be_true
      end
    end

    context 'when the api key is not blank' do
      it 'is false' do
        unit = build_stubbed(:unit, api_key: '123')
        expect(unit.send_new_api_key?).to be_false
      end
    end
  end

  describe '#generate_api_key' do
    context 'when send_new_api_key? is true' do
      it 'will generate a new api_key' do
        unit = create(:unit)
        unit.stubs(:send_new_api_key?).returns(true)
        expect(unit.generate_api_key).to be_instance_of(String)
        expect(unit.api_key).not_to be_nil
      end
    end
  end

  describe "#check_in" do
    it 'will update last_checked_in_at' do
      unit = create(:unit)
      unit.check_in
      unit.reload

      expect(unit.last_checked_in_at).to be_within(1.minute).of(Time.now)
    end
  end

  describe "#set_current_url" do
    it 'will update current_url' do
      unit = create(:unit)
      unit.set_current_url('http://www.google.com')
      unit.reload

      expect(unit.current_url).to eq('http://www.google.com')
    end

    context 'given a string without http' do
      it 'will set the url to the bookmark' do
        bookmark = create(:bookmark, name: 'mylink')
        unit = create(:unit)
        unit.set_current_url(bookmark.name)
        unit.reload

        expect(unit.current_url).to eq(bookmark.url)
      end

      context 'when there is not a bookmark with that name' do
        it 'will return false' do
          unit = build_stubbed(:unit)
          set_url = unit.set_current_url('non existant bookmark')

          expect(set_url).to be_false
        end
      end
    end
  end
end
