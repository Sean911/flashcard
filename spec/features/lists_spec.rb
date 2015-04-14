require 'rails_helper'

feature 'user sees lists of words', %Q{
  As a user
  I want to see what lists are available
  So that I can choose one for my quiz
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:list) { FactoryGirl.create(:list) }

  before :each do
    sign_in user
  end

  scenario 'see all available lists' do
    visit lists_path

    expect(page).to have_content('List_')
  end

  scenario "user creates new list" do
   visit lists_path
   click_on "Create a new list"

   expect(page).to have_content("Name")
  end
end
