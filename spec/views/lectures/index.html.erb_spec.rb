require 'rails_helper'

RSpec.describe "lectures/index", type: :view do
  before(:each) do
    assign(:lectures, [
      Lecture.create!(
        :content => "MyText",
        :user => nil
      ),
      Lecture.create!(
        :content => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of lectures" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
