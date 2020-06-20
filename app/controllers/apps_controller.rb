class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  def index
    @apps = App.all
  end

  def new
    @app = App.new
  end

  def edit
  end

  def create
    @app = App.new(app_params)

    if @app.save
      redirect_to apps_path, notice: 'App was successfully created.'
    else
      render :new
    end
  end

  def update
    if @app.update(app_params)
      redirect_to apps_path, notice: 'App was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @app.destroy
    redirect_to apps_url, notice: 'App was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_params
      params.require(:app).permit(:name, :smtp_key, :smtp_secret, :smtp_address, :smtp_port, :smtp_authentication)
    end
end
