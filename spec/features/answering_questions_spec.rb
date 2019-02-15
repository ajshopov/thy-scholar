require 'rails_helper'

RSpec.feature "Users can answer questions" do
  scenario "on the question page" do
    question = FactoryBot.create(:question, query: "Very philosophical question")

    visit "/"
    click_link "Very philosophical question"
    fill_in "Answer", with: "First answer"

    expect(page).to have_content "Answer has been created."
    expect(page).to have_content "First answer"
  end
end