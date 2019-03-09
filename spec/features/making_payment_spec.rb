require 'rails_helper'

RSpec.feature 'Users can make CC payment' do
  let!(:sender) { FactoryBot.create(:user) }
  let!(:expert) { FactoryBot.create(:user) }
  let(:question) { FactoryBot.create(:question,
    sender: sender, recipient: expert, state: 'pending') }
  
  context 'for a question' do
    before do
      login_as(sender)
      visit question_path(question)
      # click_link 'Make payment'
    end

    scenario 'with valid attributes' do
      # CC details
      # pay, redirect
      # fill_in 'Your Question', with: 'Why is this website so poorly designed?'
      # fill_in 'Amount (USD)', with: 10
      # click_button 'Create Question'

      # expect(page).to have_content 'Question has been created.'
      # expect(page).to have_content "Asked by #{sender.email}"
      # expect(page).to have_content "Directed to #{expert.email}"
      # expect(page).to have_content "State: pending"
    end
  end
end