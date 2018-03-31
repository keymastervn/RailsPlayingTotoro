class ProgrammingLanguageService
  def initialize(params = {})
    @params = params
  end

  def params
    @params
  end

  def all_pl
    # not a typical cache technique in real world application for model, can be
    # deprecated once db get updates, but this is the simplest cache solution
    # for consistent data
    @@all_pl ||= ProgrammingLanguage.all
  end

  def self.not_used
    new.all_pl.select{|x| x.developers.blank?}
  end
end