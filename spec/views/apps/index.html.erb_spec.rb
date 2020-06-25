require 'rails_helper'

RSpec.describe "apps/index", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    assign(:apps, [
      App.create!(
        name: "Name",
        smtp_key: "Smtp Key",
        smtp_secret: "Smtp Secret",
        smtp_address: "Smtp Address",
        smtp_port: 2,
        smtp_authentication: "Smtp Authentication",
        user_id: user.id
      ),
      App.create!(
        name: "Name",
        smtp_key: "Smtp Key",
        smtp_secret: "Smtp Secret",
        smtp_address: "Smtp Address",
        smtp_port: 2,
        smtp_authentication: "Smtp Authentication",
        user_id: user.id
      )
    ])
  end

  it "renders a list of apps" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
