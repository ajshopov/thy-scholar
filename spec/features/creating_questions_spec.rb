require 'rails_helper'

RSpec.feature "Users can create new questions" do
  before do
    visit '/'
    click_link "New Question"
  end

  scenario "with valid attributes" do
    fill_in "Your Question", with: "Why is this website so poorly designed?"
    click_button "Create Question"
    
    expect(page).to have_content "Question has been created."
  end
  
  scenario "with invalid attributes" do
    click_button "Create Question"

    expect(page).to have_content "Question has not been created."
    expect(page).to have_content "Query can't be blank"
  end
end