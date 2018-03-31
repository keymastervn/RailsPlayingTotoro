class DevelopersController < ApplicationController

  def index
    @response = developer_service.search
  end

  def developer_service
    DeveloperService.new(params)
  end

  def show
  end

end
