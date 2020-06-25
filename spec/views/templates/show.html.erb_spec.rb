require 'rails_helper'

RSpec.describe "templates/show", type: :view do
  before(:each) do
    @template = assign(:template, Template.create!(
      name: "Name",
      content: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
