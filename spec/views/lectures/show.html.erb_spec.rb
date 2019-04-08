require 'rails_helper'

RSpec.describe "lectures/show", type: :view do
  before(:each) do
    @lecture = assign(:lecture, Lecture.create!(
      :content => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
