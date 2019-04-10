require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

RSpec.feature 'Users can create new lectures' do
  let!(:user) { FactoryBot.create(:user) }

  context "not a user" do
    scenario "user must be signed in" do
      visit user_path(user)

      expect(page).to have_no_button('New Lecture')
    end
  end


  context "user signed in" do
    before do
      login_as(user)
      visit user_path(user)
    end


    scenario 'with valid attributes', js: true do
      click_link "New Lecture"
      fill_in 'Title', with: 'The Known Unknown'
      find('trix-editor').click.set("this is the lecture text")
      click_button 'Create Lecture'

      expect(page).to have_content 'Lecture was successfully created.'
      expect(page).to have_content "#{user.name}"
    end

    # doesn't check for content presence, only title?
    scenario 'with invalid attributes' do
      click_link "New Lecture"
      click_button 'Create Lecture'

      expect(page).to have_content "Title can't be blank"
    end
  end
end