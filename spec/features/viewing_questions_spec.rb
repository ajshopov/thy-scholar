require 'rails_helper'

RSpec.feature 'Users can view questions' do
  scenario 'with question details on the question page' do
    user = FactoryBot.create(:user)
    recipient = FactoryBot.create(:user)
    question = FactoryBot.create(:question, query: 'Testing out',
      sender: user, recipient: recipient)

    visit '/'
    click_link 'Testing out'
    expect(page.current_url).to eq question_url(question)
  end
end
