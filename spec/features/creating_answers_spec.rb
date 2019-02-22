require 'rails_helper'

RSpec.feature 'Users can answer questions' do
  let(:user) { FactoryBot.create(:user) }
  let(:expert) { FactoryBot.create(:user) }
  let(:question) { FactoryBot.create(:question, user: user) }

  scenario 'with a valid answer' do
    visit question_path(question)

    fill_in 'Response', with: 'First answer'
    click_button 'Create Answer'
    
    expect(page).to have_content 'Answer has been created.'
    expect(page).to have_content 'First answer'
  end
  
  # scenario 'with an invalid answer' do
  #   let(:question) { FactoryBot.create(:question) }
  #   visit question_path(question)

  #   click_button 'Create Answer'

  #   expect(page).to have_content 'Answer has not been created.'
  #   expect(page).to have_content "Response can't be blank"
  # end
end
