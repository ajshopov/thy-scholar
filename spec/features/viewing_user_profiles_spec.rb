require 'rails_helper'

RSpec.feature "Users can view" do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
    visit '/'
  end

  scenario "their own profile" do
    visit '/users'
    click_link "#{user.email}"

    expect(page.current_url).to eq user_url(user)
  end
end