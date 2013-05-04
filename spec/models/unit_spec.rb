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
end
