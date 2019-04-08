require 'rails_helper'

RSpec.feature 'Users can create new lectures' do
  let!(:user) { FactoryBot.create(:user) }

  context "not a user" do
    scenario "user must be signed in" do
      visit user_path(user)

      expect(page).to have_no_button('Create Lecture')
    end
  end


  context "user signed in" do
    before do
      login_as(user)
      visit user_path(user)
    end

    scenario 'with valid attributes' do
      fill_in 'Content', with: 'This website needs more work.'
      click_button 'Create Lecture'

      expect(page).to have_content 'Lecture has been created.'
      expect(page).to have_content "By #{user.name}"
    end

    scenario 'with invalid attributes' do
      click_button 'Create Lecture'

      expect(page).to have_content 'Lecture has not been created.'
      expect(page).to have_content "Content can't be blank"
    end
  end
end