class DevelopersDatatable < ApplicationDatatable
  private

  def data
    devs.map do |dev|
      [].tap do |column|
        column << dev.email
        column << dev.programming_languages.collect(&:name).join(', ')
        column << dev.languages.collect(&:code).join(', ')

        links = []
        links << link_to('Destroy', dev, method: :delete, data: { confirm: 'Are you sure?' })
        column << links.join(' | ')
      end
    end
  end

  def count
    Developer.count
  end

  def total_entries
    devs.total_count
    # will_paginate
    # devs.total_entries
  end

  def devs
    @devs ||= fetch_devs
  end

  def fetch_devs
    search_string = []
    columns.each do |term|
      search_string << "#{term} like :search"
    end

    # will_paginate
    devs = Developer.includes(:programming_languages, :languages).order("#{sort_column} #{sort_direction}")
    devs = devs.page(page).per(per_page)
    devs = devs.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
  end

  def columns
    %w(email)
  end
end