require 'spec_helper'

describe Unit do
  it { should validate_uniqueness_of(:mac_address) }
  it { should validate_presence_of(:mac_address) }
end
