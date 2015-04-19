require 'rails_helper'
require 'pry'

feature 'user sees a list of words', %Q{
  As a user
  I want to see what lists are available
  So that I can choose one for my quiz
} do
  let!(:user) { FactoryGirl.create(:user) }


  #let!(:list) { FactoryGirl.create(:list, owner_id: user.id) }
  let!(:owned_list) { FactoryGirl.create(:list, user_id: user.id) }
  let!(:word) { FactoryGirl.create(:word, list_id: owned_list.id) }

  before :each do
    sign_in user
  end

  scenario 'see all words in a list' do
    visit list_path(owned_list)

    expect(page).to have_content(word.name)
  end

  scenario 'add words to list' do
    visit list_path(owned_list)
    click_button("Add word")
    fill_in("Name", with: "sailboat")
    fill_in("Definition", with: "a boat propelled by sails")
    click_button("Create")

    expect(page).to have_content("Word added!")
  end

  scenario 'remove words from list' do
    visit list_path(owned_list)
    click_button("Remove word")

    expect(page).to have_content("Word removed!")
  end



end
