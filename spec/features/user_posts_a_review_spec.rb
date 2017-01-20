require 'spec_helper'
require 'rails_helper'
require 'database_cleaner'


DatabaseCleaner.strategy = :truncation

feature "Post new review on game" do
  let!(:game) { FactoryGirl.create(:game) }
  let!(:user) { FactoryGirl.create(:user, name: "Tom2", email: "Tom2@hogwarts.com") }

  scenario "User is not logged in" do
    visit game_path(game)
    fill_in "Rating", with: "5"
    fill_in "Comment", with: "This is a good game"
    click_on "Submit your review"



    expect(page).to have_content("User must exist")
  end

  scenario "User logs in and posts a review" do

    visit game_path(game)
    click_link "Login"
    fill_in "Email", with: "Tom2@hogwarts.com"
    fill_in "Password", with: "HarryPotter"
    click_button "Log in"

    visit game_path(game)
    fill_in "Rating", with: "5"
    fill_in "Comment", with: "This is a good game"
    click_on "Submit your review"


    expect(page).to have_content("5")
    expect(page).to have_content("This is a good game")

  end

  scenario "User omits rating" do

    visit game_path(game)
    fill_in "Comment", with: "This is a good game"
    click_on "Submit your review"

    expect(page).to have_content("Rating can't be blank")
  end

  scenario "User submits rating to high" do

    visit game_path(game)
    fill_in "Comment", with: "This is a good game"
    fill_in "Rating", with: "6"
    click_on "Submit your review"

    expect(page).to have_content("Rating must be between 1 and 5")

  end

  scenario "User submits rating to low" do

    visit game_path(game)
    fill_in "Comment", with: "This is a good game"
    fill_in "Rating", with: "0"
    click_on "Submit your review"

    expect(page).to have_content("Rating must be between 1 and 5")
  end
end
DatabaseCleaner.clean
