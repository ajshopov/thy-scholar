require 'rails_helper'

RSpec.feature 'Users can answer questions' do
  let(:sender) { FactoryBot.create(:user) }
  let(:other) { FactoryBot.create(:user) }
  let(:expert) { FactoryBot.create(:user) }
  let(:question) { FactoryBot.create(:question,
    sender: sender, recipient: expert, state: 'pending') }

  context 'expert can answer' do
    before do
      login_as(expert)
      visit question_path(question)
      click_link 'Answer this question'
    end
    
    # scenario 'reject question' do
    #   click_link 'Reject question'
    # end
    
    scenario 'accepts question' do
      fill_in 'Answer', with: 'First answer woo'
      click_button 'Create Answer'
  
      expect(page).to have_content 'Answer has been created.'
      expect(page).to have_content 'First answer woo'
      expect(page).to have_content 'completed'
      # within('.answer #state') do
      #   expect(page).to have_content 'Complete'
      # end
    end

    scenario 'but not with an invalid answer' do
      click_button 'Create Answer'
  
      expect(page).to have_content 'Answer has not been created.'
    end
  end

  scenario 'but not if they arent the intended recipient' do
    login_as(other)
    visit question_path(question)

    expect(page).not_to have_link 'Answer this question'
  end
end
