require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

RSpec.feature 'Users can edit profile' do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
    visit user_path(user)
  end

  scenario "upload their own profile picture", js: true do
    click_link "Edit your details"

    fill_in "Current password", with: "password"
    attach_file "Upload a Profile Picture", Rails.root.join("public/uploads/user/profile_pic/2/tsar_wars.jpg")

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."
    expect(page).to have_css("img[src*='tsar_wars.jpg']")
  end
end
