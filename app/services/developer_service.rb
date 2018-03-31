class DeveloperService
  def initialize(params = {})
    @params = params
  end

  def params
    @params
  end

  def all_dev
    # not a typical cache technique in real world application for model, can be
    # deprecated once db get updates, but this is the simplest cache solution
    # for consistent data
    @@all_dev ||= Developer.all
  end

  def search
    languages = params[:languages].to_s.split(',')
    prog_langs = params[:programming_langs].to_s.split(',')

    devs = all_dev
    languages.each{|l|
      devs = devs.select{|x| x.can_speak l}
    }

    prog_langs.each {|pl|
      devs = devs.select{|x| x.can_write pl}
    }

    devs
  end
end