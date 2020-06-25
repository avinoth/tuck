require 'rails_helper'

RSpec.describe "/templates", type: :request do
  let(:user) { create(:user) }
  let(:app) { create(:app, user: user) }

  let(:valid_attributes) {
    {
      name: 'Welcome email',
      content: '<h1>Hello</h1>'
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }


  before { sign_in user }


  describe "GET /index" do
    it "renders a successful response" do
      create(:template, app: app)
      get app_templates_url(@app)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_app_template_url(@app)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      template = Template.create! valid_attributes
      get edit_template_url(template)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Template" do
        expect {
          post templates_url, params: { template: valid_attributes }
        }.to change(Template, :count).by(1)
      end

      it "redirects to the created template" do
        post templates_url, params: { template: valid_attributes }
        expect(response).to redirect_to(template_url(Template.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Template" do
        expect {
          post templates_url, params: { template: invalid_attributes }
        }.to change(Template, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post templates_url, params: { template: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested template" do
        template = Template.create! valid_attributes
        patch template_url(template), params: { template: new_attributes }
        template.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the template" do
        template = Template.create! valid_attributes
        patch template_url(template), params: { template: new_attributes }
        template.reload
        expect(response).to redirect_to(template_url(template))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        template = Template.create! valid_attributes
        patch template_url(template), params: { template: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested template" do
      template = Template.create! valid_attributes
      expect {
        delete template_url(template)
      }.to change(Template, :count).by(-1)
    end

    it "redirects to the templates list" do
      template = Template.create! valid_attributes
      delete template_url(template)
      expect(response).to redirect_to(templates_url)
    end
  end
end
