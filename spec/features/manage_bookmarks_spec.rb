require 'spec_helper'

feature 'bookmark managements' do
  scenario 'list all bookmarks' do
    create_bookmarks
    sign_in
    click_bookmarks_link
    verify_bookmarks_are_visible
  end

  scenario 'delete a bookmark' do
    create_bookmark
    sign_in_with_backdoor
    click_bookmarks_link
    delete_bookmark
    verify_bookmark_deleted
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

def create_bookmark
  create(:bookmark, name: 'My Bookmark')
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

def delete_bookmark
  click_on 'Delete'
end

def verify_bookmark_deleted
  expect(page).not_to have_content('My Bookmark')
end
