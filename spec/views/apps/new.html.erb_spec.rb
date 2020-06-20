require 'rails_helper'

RSpec.describe "apps/new", type: :view do
  before(:each) do
    assign(:app, App.new(
      name: "MyString",
      smtp_key: "MyString",
      smtp_secret: "MyString",
      smtp_address: "MyString",
      smtp_port: 1,
      smtp_authentication: "MyString"
    ))
  end

  it "renders new app form" do
    render

    assert_select "form[action=?][method=?]", apps_path, "post" do

      assert_select "input[name=?]", "app[name]"

      assert_select "input[name=?]", "app[smtp_key]"

      assert_select "input[name=?]", "app[smtp_secret]"

      assert_select "input[name=?]", "app[smtp_address]"

      assert_select "input[name=?]", "app[smtp_port]"

      assert_select "input[name=?]", "app[smtp_authentication]"
    end
  end
end
