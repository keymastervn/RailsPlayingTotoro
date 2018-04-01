# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sample_f_names = ['le', 'nguyen', 'vo', 'tran', 'ly', 'trieu', 'dinh', 'hoang', 'huynh']
sample_m_names = ['van', 'vo', 'tien', 'hong', 'trung', 'thi']
sample_names = ['dat', 'hoang', 'giang', 'thanh', 'hung', 'sang', 'thi', 'chien', 'minh', 'truong', 'tien', 'dung']
mail_providers = ['yahoo.com', 'google.com', 'kenh14.vn', 'vnexpress.net', 'now.vn', 'foody.vn', 'coffee.vn']

email_generate = -> (a,b,c,d) { "#{a.sample}.#{b.sample}_#{c.sample}#{rand(101..1231)}@#{d.sample}"}

100.times do
  Developer.find_or_create_by(email: email_generate.call(sample_f_names, sample_m_names, sample_names, mail_providers))
end

# 5 demo languages
Language.create(code: 'jp')
Language.create(code: 'vn')
Language.create(code: 'en')
Language.create(code: 'kr')
Language.create(code: 'ru')

# 7 programming languages
ProgrammingLanguage.create(name: 'ruby')
ProgrammingLanguage.create(name: 'c++')
ProgrammingLanguage.create(name: 'java')
ProgrammingLanguage.create(name: 'scala')
ProgrammingLanguage.create(name: 'golang')

# random create serveral relationships between a developer and langs
# as well as programming languages, check distinction for uniqueness
Developer.all.each {|dev|
  1..(rand(1..5)).times do
    l = Language.find rand(1..(Language.count))
    pl = ProgrammingLanguage.find rand(1..(ProgrammingLanguage.count))

    dev.languages << l unless dev.languages.collect(&:code).include? l.code
    dev.programming_languages << pl unless dev.programming_languages.collect(&:name).include? pl.name
  end
}

# no one use these languages
ProgrammingLanguage.create(name: 'c#')
ProgrammingLanguage.create(name: 'rust')
