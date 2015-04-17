require 'rails_helper'
require 'pry'

feature 'user sees a list of words', %Q{
  As a user
  I want to see what lists are available
  So that I can choose one for my quiz
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:word) { FactoryGirl.create(:word) }
  let!(:list) { FactoryGirl.create(:list, owner_id: user.id) }

  before :each do
    sign_in user
  end

  scenario 'see all words in a list' do
    visit list_path(list)

    expect(page).to have_content(word.name)
  end

  scenario 'add words to list' do
    visit list_path(list)
    click_button("Add a word")
    fill_in("name", with: "sailboat")
    fill_in("description", with: "a boat propelled by sails")
    click_button("Create")

    expect(page).to have_content("Word successfully added!")
  end

  scenario 'remove words from list'


end
