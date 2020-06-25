require 'rails_helper'

RSpec.describe "templates/new", type: :view do
  before(:each) do
    assign(:template, Template.new(
      name: "MyString",
      content: "MyText"
    ))
  end

  it "renders new template form" do
    render

    assert_select "form[action=?][method=?]", templates_path, "post" do

      assert_select "input[name=?]", "template[name]"

      assert_select "textarea[name=?]", "template[content]"
    end
  end
end
