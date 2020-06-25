require 'rails_helper'

RSpec.describe "/apps", type: :request do
  let(:valid_attributes) do
    {
      name: 'Trackiem',
      smtp_key: Faker::Alphanumeric.alpha(number: 10),
      smtp_secret: Faker::Alphanumeric.alpha(number: 20),
      smtp_address: Faker::Internet.url,
      smtp_port: 587,
      smtp_authentication: :plain
    }
  end

  let(:invalid_attributes) {
    {
      name: ''
    }
  }

  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET /index" do
    it "renders a successful response" do
      create(:app, user: user)
      get apps_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_app_url

      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      app = create(:app, user: user)
      get edit_app_url(app)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new App" do
        expect {
          post apps_url, params: { app: valid_attributes }
        }.to change(App, :count).by(1)
      end

      it "redirects to the  app list" do
        post apps_url, params: { app: valid_attributes }
        expect(response).to redirect_to(apps_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new App" do
        expect {
          post apps_url, params: { app: invalid_attributes }
        }.to change(App, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post apps_url, params: { app: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: 'Finesse'
        }
      }

      it "updates the requested app" do
        app = create(:app, user: user)
        patch app_url(app), params: { app: new_attributes }
        app.reload
        expect(app.name).to eq('Finesse')
      end

      it "redirects to the app" do
        app = create(:app, user: user)
        patch app_url(app), params: { app: new_attributes }
        app.reload
        expect(response).to redirect_to(apps_url)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        app = create(:app, user: user)
        patch app_url(app), params: { app: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested app" do
      app = create(:app, user: user)
      expect {
        delete app_url(app)
      }.to change(App, :count).by(-1)
    end

    it "redirects to the apps list" do
      app = create(:app, user: user)
      delete app_url(app)
      expect(response).to redirect_to(apps_url)
    end
  end
end
