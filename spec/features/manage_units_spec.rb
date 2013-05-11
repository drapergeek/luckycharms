require 'spec_helper'

feature 'unit management' do
  scenario 'list all units' do
    create_units
    sign_in_with_backdoor
    navigate_to_units
    verify_units_are_visible
  end
end

def create_units
  @units = create_list(:unit, 2)
end

def sign_in_with_backdoor
  user = create(:user)
  visit root_path(as: user)
end

def navigate_to_units
  click_on 'Units'
end

def verify_units_are_visible
  @units.each do |unit|
    expect(page).to have_content(unit.name)
    expect(page).to have_content(unit.current_url)
  end
end
