class ProgrammingLanguagesController < ApplicationController
  def index
    @programming_languages = pl_service.all_pl
    @not_used = pl_service.class.not_used
  end

  protected
  def pl_service
    ProgrammingLanguageService.new(params)
  end
end
