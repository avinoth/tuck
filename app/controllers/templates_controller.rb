class TemplatesController < ApplicationController
  before_action :set_app
  before_action :set_template, only: [:edit, :update, :destroy]

  def index
    @templates = @app.templates.all
  end

  def new
    @template = @app.templates.new
  end

  def edit
  end

  def create
    @template = @app.templates.new(template_params)

    if @template.save
      redirect_to templates_url(app: @app), notice: 'Template was successfully created.'
    else
      render :new
    end
  end

  def update
    if @template.update(template_params)
      redirect_to templates_url(app: @app), notice: 'Template was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @template.destroy
    redirect_to templates_url(app: @app), notice: 'Template was successfully destroyed.'
  end

  private

    def set_app
      @app = App.find(params[:app_id])
    end

    def set_template
      @template = Template.find(params[:id])
    end

    def template_params
      params.require(:template).permit(:name, :content)
    end
end
