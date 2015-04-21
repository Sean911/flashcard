require 'rails_helper'
require 'pry'

feature 'user sees lists of words', %Q{
  As a user
  I want to see what lists are available
  So that I can choose one for my quiz
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user3) { FactoryGirl.create(:user) }
  let!(:list) { FactoryGirl.create(:list) }
  let!(:list2) { FactoryGirl.create(:list) }
  let!(:owned_list) { FactoryGirl.create(:list, user_id: user3.id) }
  let!(:word) { FactoryGirl.create(:word, list_id: list.id) }
  let!(:word2) { FactoryGirl.create(:word, list_id: list.id) }
  let!(:word3) { FactoryGirl.create(:word, list_id: list.id) }

  #
  # before :each do
  #   sign_in user
  # end

  scenario 'go to quiz screen' do
    sign_in user
    visit list_path(list)
    click_button("Quiz me")

    expect(page).to have_content(word.name)
  end

  scenario 'see word and definition' do
    sign_in user
    visit quiz_path(list)
    click_link(word.name)

    expect(page).to have_content(word.definition)
  end


  scenario 'return to quiz' do
    sign_in user
    visit word_path(word)
    click_button("Return to quiz")

    expect(page).to have_content(word.name)
    expect(page).to have_content(word2.name)
  end

  scenario 'end quiz' do
    sign_in user
    visit quiz_path(list)
    click_button('End quiz')

    expect(page).to have_content(list.name)
  end


end
