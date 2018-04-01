class DevelopersDatatable < ApplicationDatatable
  delegate :new_interview_path, to: :@view
  private

  def data
    devs.map do |dev|
      [].tap do |column|
        column << dev.email
        # column << dev.programming_languages.collect(&:name).join(', ')
        # column << dev.languages.collect(&:code).join(', ')
        column << dev.pl
        column << dev.l

        links = []
        links << link_to('Destroy', dev, method: :delete, data: { confirm: 'Are you sure?' })
        links << link_to('Create Interview', new_interview_path(dev: dev), data: { confirm: "You are going to interview #{dev.email}?" })
        column << links.join(' | ')
      end
    end
  end

  def count
    Developer.count
  end

  def total_entries
    Developer.joins(:programming_languages, :languages).
      where(get_search_string.join(' or '), search: "%#{params[:search][:value]}%").
      count
    # will_paginate
    # devs.total_entries
  end

  def devs
    @devs ||= fetch_devs
  end

  def fetch_devs
    # will_paginate
    devs = Developer.joins(:programming_languages, :languages).
      select("developers.id, developers.email,
         group_concat(distinct programming_languages.name) as pl,
         group_concat(distinct languages.code) as l").
      group('developers.id, developers.email').
      order("#{sort_column} #{sort_direction}")
    devs = devs.page(page).per(per_page)
    devs = devs.where(get_search_string.join(' or '), search: "%#{params[:search][:value]}%")
  end

  def get_search_string
    search_string = []
    columns.each do |term|
      search_string << "#{term} like :search"
    end
    search_string
  end

  def columns
    %w(email)
  end
end