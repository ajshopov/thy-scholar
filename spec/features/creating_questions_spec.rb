require 'rails_helper'

RSpec.feature "Users can create new questions" do
  scenario "with valid valid attributes" do
    visit '/'

    click_link "New Question"

    fill_in "Your Question", with: "Why is this website so poorly designed?"
    click_button "Create Question"

    expect(page).to have_content "Question has been created."
  end
end