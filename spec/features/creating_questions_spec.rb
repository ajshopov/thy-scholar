require 'rails_helper'

RSpec.feature 'Users can create new questions' do
  let!(:sender) { FactoryBot.create(:user) }
  let!(:expert) { FactoryBot.create(:user) }

  context "not a user" do
    scenario "user must be signed in" do
      visit user_path(expert)
      click_link 'New question'

      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end


  context "user signed in" do
    before do
      login_as(sender)
      visit user_path(expert)
      click_link 'New question'
    end

    scenario 'with valid attributes' do
      fill_in 'Your Question', with: 'Why is this website so poorly designed?'
      select "#{expert.email}", :from => "Recipient"
      click_button 'Create Question'

      expect(page).to have_content 'Question has been created.'
      expect(page).to have_content "Asked by #{sender.email}"
    end

    scenario 'with invalid attributes' do
      click_button 'Create Question'

      expect(page).to have_content 'Question has not been created.'
      expect(page).to have_content "Query can't be blank"
    end
  end
end
