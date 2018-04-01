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

  def some_dev
    ids = params[:id].to_s.split(',').sort.flatten.uniq

    ids.present? ? devs = Developer.find(ids).to_a : all_dev
  end

  def search(devs)
    languages = params[:languages].to_s.split(',')
    prog_langs = params[:programming_langs].to_s.split(',')

    languages.each{|l|
      devs = devs.select{|x| x.can_speak l}
    }

    prog_langs.each {|pl|
      devs = devs.select{|x| x.can_write pl}
    }

    devs
  end

  # CACHE
  def build_key
    "#{params[:id].to_s}|#{params[:languages].to_s}|#{params[:programming_langs].to_s}"
  end

  # API
  def serve
    Rails.cache.fetch(build_key, expires_in: 30.minutes) do
      self.search(some_dev)
    end
  end
end