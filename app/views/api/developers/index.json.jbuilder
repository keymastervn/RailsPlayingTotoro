json.array! @developers do |dev|
  json.id dev.id
  json.email dev.email
  json.created_at dev.created_at

  json.programming_languages dev.programming_languages do |pl|
    json.id pl.id
    json.name pl.name
  end

  json.languages dev.languages do |l|
    json.id l.id
    json.code l.code
  end
end