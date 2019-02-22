require 'rails_helper'

RSpec.feature 'Users can answer questions' do
  let(:sender) { FactoryBot.create(:user) }
  let(:other) { FactoryBot.create(:user) }
  let(:expert) { FactoryBot.create(:user) }
  let(:question) { FactoryBot.create(:question, sender: sender, recipient: expert) }

  scenario 'as the intended recipient' do
    login_as(expert)
    visit question_path(question)

    fill_in 'Response', with: 'First answer'
    click_button 'Create Answer'

    expect(page).to have_content 'Answer has been created.'
    expect(page).to have_content 'First answer'
  end

  scenario 'not if they arent the intended recipient' do
    login_as(other)
    visit question_path(question)

    expect(page).not_to have_button 'Create Answer'
  end

  # scenario 'with an invalid answer' do
  #   click_button 'Create Answer'

  #   expect(page).to have_content 'Answer has not been created.'
  #   expect(page).to have_content "Response can't be blank"
  # end
end
