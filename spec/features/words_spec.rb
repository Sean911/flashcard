require 'rails_helper'
require 'pry'

feature 'user sees a list of words', %Q{
  As a user
  I want to see what lists are available
  So that I can choose one for my quiz
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:word) { FactoryGirl.create(:word) }

  before :each do
    sign_in user
  end

  scenario 'see all words in a list' do
    visit lists_path
    click_on word.list.name

    expect(page).to have_content(word.name)
  end
end
