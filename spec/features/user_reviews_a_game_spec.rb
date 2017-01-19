require 'spec_helper'
require 'rails_helper'

feature "User can post a review on a game in the database" do
  scenario "Visitor wants to post a review on a game without logging in" do
    game = FactoryGirl.create(:game)

    visit root_path
    fill_in "Search Games", with: game.name
    click_on "Search"
    click_on game.name

    expect(page).to_not have_content("Post Review")
  end

  scenario "User signs in to post a review" do
    game = FactoryGirl.create(:game)
    user = FactoryGirl.create(:user, email: 'blah@blah.com')

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    fill_in "Search Games", with: game.name
    click_on "Search"
    click_on game.name

    expect(page).to have_button("Post Review")
  end

  scenario "Visitor sees all the reviews for a game" do
    game = FactoryGirl.create(:game)
    user = FactoryGirl.create(:user, email: 'blah@blah.com')
    review = FactoryGirl.create(:review, game: game, user: user)

    visit root_path
    fill_in "Search Games", with: game.name
    click_on "Search"
    click_on game.name

    expect(page).to have_content(review.comment)
    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.user.name)
  end
end
