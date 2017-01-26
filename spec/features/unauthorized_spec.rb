require 'spec_helper'
require 'rails_helper'

feature "kicks the visitor/user out if trying to access an admin-only page" do
  scenario "visitor tries to visit users path" do
    visit root_path
    visit admins_path

    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

end
