class Api::DevelopersController < Api::BaseController

  # GET /api/developers.json
  def index
     @developers = developer_service.serve
  end

  protected
  def developer_service
    DeveloperService.new(params)
  end

  private
  def dev_params
    params.permit(:id, :programming_langs, :languages)
  end
end