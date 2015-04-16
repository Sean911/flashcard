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

  #
  # before :each do
  #   sign_in user
  # end

  scenario 'see all available lists' do
    sign_in user
    visit lists_path
    expect(page).to have_content(list.name)
  end

end

feature 'user creates lists of words', %Q{
  As a user
  I want to create a list
  So that I can have my own set of words
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user3) { FactoryGirl.create(:user) }
  let!(:list) { FactoryGirl.create(:list) }
  let!(:list2) { FactoryGirl.create(:list) }
  let!(:owned_list) { FactoryGirl.create(:list, user_id: user3.id) }

  scenario "user successfully creates new list" do
    sign_in user
    visit lists_path
    click_on "Create a new list"
    fill_in("Name", with: list.name)
    click_on("Create List")

    expect(page).to have_content("List created!")
  end

  scenario "user fails to provide valid info to create new list" do
    sign_in user
    visit lists_path
    click_on "Create a new list"
    click_on("Create List")

    expect(page).to have_content("Name can't be blank")
  end
end

feature 'user deletes lists of words', %Q{
  As a user
  I want to delete my list
  So that I don't have to see it anymore
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user3) { FactoryGirl.create(:user) }
  let!(:list) { FactoryGirl.create(:list) }
  let!(:list2) { FactoryGirl.create(:list) }
  let!(:owned_list) { FactoryGirl.create(:list, user_id: user.id) }


  scenario "deleting a list" do
    sign_in(user)

    visit list_path(owned_list)

    click_button("Delete list")

    expect(page).to have_content("List deleted!")
  end

  scenario "user cannot delete someone else's list" do
    sign_in user2
    visit list_path(owned_list)
    click_button("Delete list")

    expect(page).to have_content("You can't delete someone else's list!")
  end
end
