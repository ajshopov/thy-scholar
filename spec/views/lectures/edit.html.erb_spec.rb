require 'rails_helper'

RSpec.describe "lectures/edit", type: :view do
  before(:each) do
    @lecture = assign(:lecture, Lecture.create!(
      :content => "MyText",
      :user => nil
    ))
  end

  it "renders the edit lecture form" do
    render

    assert_select "form[action=?][method=?]", lecture_path(@lecture), "post" do

      assert_select "textarea[name=?]", "lecture[content]"

      assert_select "input[name=?]", "lecture[user_id]"
    end
  end
end
