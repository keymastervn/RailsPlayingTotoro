class DevelopersController < ApplicationController
  before_action :set_dev, only: [:show, :destroy]

  def index
    # @response = developer_service.search
    respond_to do |format|
      format.html
      format.json { render json: ::DevelopersDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @developer = Developer.new
  end

  def edit
  end

  def destroy
    @developer.destroy
    respond_to do |format|
      format.html { redirect_to developers_url, notice: 'Dev was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def create
    @developer = Developer.new(dev_params)

    respond_to do |format|
      if @developer.save
        format.html { redirect_to @developer, notice: 'Dev was successfully created.' }
        format.json { render :show, status: :created, location: @developer }
      else
        format.html { render :new }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  protected
  def developer_service
    DeveloperService.new(params)
  end

  private
  def set_dev
    @developer = Developer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dev_params
    params.require(:developer).permit(:email)
  end
end
