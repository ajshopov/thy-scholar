require 'rails_helper'

RSpec.feature "Users can sign in" do
  let(:user) { FactoryBot.create(:user) }

  scenario "with valid credentials" do
    visit '/'
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Logged in as: #{user.name}")
  end
end