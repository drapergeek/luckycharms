require 'spec_helper'

feature 'bookmark managements' do
  scenario 'list all bookmarks' do
    create_bookmarks
    sign_in
    click_bookmarks_link
    verify_bookmarks_are_visible
  end
end

def sign_in
  user = create(:user)
  visit root_url
  click_link 'Sign in'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Sign in'
end

def create_bookmarks
  @bookmarks = create_list(:bookmark, 2)
end

def click_bookmarks_link
  click_on 'Bookmarks'
end

def verify_bookmarks_are_visible
  @bookmarks.each do |bookmark|
    expect(page).to have_content bookmark.name
    expect(page).to have_content bookmark.url
  end
end
