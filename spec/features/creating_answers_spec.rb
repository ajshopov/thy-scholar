require 'rails_helper'

RSpec.feature 'Users can answer questions' do
  let(:question) { FactoryBot.create(:question) }

  scenario 'by putting a valid answer' do
    visit question_path(question)
    fill_in 'Response', with: 'First answer'
    click_button 'Create Answer'

    expect(page).to have_content 'Answer has been created.'
    expect(page).to have_content 'First answer'
  end
end
