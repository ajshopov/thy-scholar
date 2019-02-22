require 'rails_helper'

RSpec.feature 'Users can create new questions' do
  let!(:user) { FactoryBot.create(:user) }
  let!(:expert) { FactoryBot.create(:user) }

  context "not a user" do
    scenario "user must be signed in" do
      visit '/'
      click_link 'User List'
      click_link 'test2@thyscholar.com'
      fill_in 'Your Question', with: 'Why is this website so poorly designed?'
      click_button 'Create Question'

      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end


  context "user signed in" do
    before do
      login_as(user)
      visit '/'
      click_link 'User List'
    end

    scenario 'with valid attributes' do
      click_link 'test4@thyscholar.com'
      fill_in 'Your Question', with: 'Why is this website so poorly designed?'
      click_button 'Create Question'

      expect(page).to have_content 'Question has been created.'
      expect(page).to have_content "Asked by #{user.email}"
    end

    scenario 'with invalid attributes' do
      click_link 'test6@thyscholar.com'
      click_button 'Create Question'

      expect(page).to have_content 'Question has not been created.'
      expect(page).to have_content "Query can't be blank"
    end
  end
end
