require 'rails_helper'

RSpec.feature "Users can sign up" do
  scenario "With valid attributes" do
    visit '/'
    click_link 'Sign Up'
    fill_in "Email", with: "test@thyscholar.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully.")
  end
end