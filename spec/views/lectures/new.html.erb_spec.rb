require 'rails_helper'

RSpec.describe "lectures/new", type: :view do
  before(:each) do
    assign(:lecture, Lecture.new(
      :content => "MyText",
      :user => nil
    ))
  end

  it "renders new lecture form" do
    render

    assert_select "form[action=?][method=?]", lectures_path, "post" do

      assert_select "textarea[name=?]", "lecture[content]"

      assert_select "input[name=?]", "lecture[user_id]"
    end
  end
end
