require 'rails_helper'

RSpec.describe "apps/show", type: :view do
  before(:each) do
    @app = assign(:app, App.create!(
      name: "Name",
      smtp_key: "Smtp Key",
      smtp_secret: "Smtp Secret",
      smtp_address: "Smtp Address",
      smtp_port: 2,
      smtp_authentication: "Smtp Authentication"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Smtp Key/)
    expect(rendered).to match(/Smtp Secret/)
    expect(rendered).to match(/Smtp Address/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Smtp Authentication/)
  end
end
