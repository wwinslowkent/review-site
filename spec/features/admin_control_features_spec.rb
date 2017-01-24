require 'spec_helper'
require 'rails_helper'

feature 'admin deletes a user' do
  scenario 'admin sees their dashboard' do
    admin = FactoryGirl.create(:admin)
    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    click_link "Dashboard"

    expect(page).to have_content('Admin Dashboard')
  end

  scenario 'admin sees all the users' do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    click_link "Dashboard"
    click_link "User List"

    expect(page).to have_content(user.name)
    expect(page).to have_content(user2.name)
  end

  scenario 'admin deletes a user' do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)

    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    click_link "Dashboard"
    click_link "User List"

    expect(page).to have_content(user.name)

    click_button "Delete User Account"

    expect(page).to_not have_content(user.name)
  end
end

feature 'admin controls a game' do
  scenario 'admin deletes a game' do
    admin = FactoryGirl.create(:admin)
    game = FactoryGirl.create(:game)

    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    visit game_path(game)

    expect(page).to have_button('Edit Game')

    click_button 'Edit Game'

    expect(page).to have_button('Delete Game')

    click_button 'Delete Game'

    expect(page).to have_content('You have deleted this game successfully')
  end
end

feature 'admin deletes a review' do
  scenario 'admin deletes an inappropriate review' do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)
    game = FactoryGirl.create(:game)
    review = FactoryGirl.create(:review, user: user, game: game)

    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    visit game_path(game)


    #expect(page).to have_button('Delete Review')

    #click_button 'Delete Review'

    expect(page).to_not have_content(review.comment)
  end
end
