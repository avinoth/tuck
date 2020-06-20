require 'rails_helper'

RSpec.describe "apps/index", type: :view do
  before(:each) do
    assign(:apps, [
      App.create!(
        name: "Name",
        smtp_key: "Smtp Key",
        smtp_secret: "Smtp Secret",
        smtp_address: "Smtp Address",
        smtp_port: 2,
        smtp_authentication: "Smtp Authentication"
      ),
      App.create!(
        name: "Name",
        smtp_key: "Smtp Key",
        smtp_secret: "Smtp Secret",
        smtp_address: "Smtp Address",
        smtp_port: 2,
        smtp_authentication: "Smtp Authentication"
      )
    ])
  end

  it "renders a list of apps" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Smtp Key".to_s, count: 2
    assert_select "tr>td", text: "Smtp Secret".to_s, count: 2
    assert_select "tr>td", text: "Smtp Address".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Smtp Authentication".to_s, count: 2
  end
end
