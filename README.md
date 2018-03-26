# Description

* Let me know if you find strange point/have a question about this exam.
* You don’t need to solve all of exam. You can submit even if work in progress.
* We understand your time is limited.
* Ideally, Rails version should be used is Rails 5. But you can use another version that
you used to.

# Deadline

* 02 days.
* Standard: ~10 hours. (Of course you can spent more time if you want to finish all of
section).
* Please measure time to finish.

# Table (model) structure

* There are “developers table, programming_languages table, languages table”.
These table’s structure is many to many.
* Relationship between developers table and interviews table is developers has many
interviews.
* Column information
  - Developers
    + Email(not null)
  - Programming_languages
    + Name(not null)(e.g. ruby, javascript, python, scala, kotlin, swift)


  - Languages
    + Code(not null)(e.g. en, ja, cn)
  - Interviews
    + Score(e.g. number such as 1-5)
  - Comment

# Ruby gem

* We recommend “rspec”, “factory_bot”, “slim”. But you can use a gem that you
want to use.

## (A) Requirements of front page (Search)

* Please create “developers”, “programming_languages”, “languages” table.
* Please implement below page that fulfill followings conditions and able to search
“developers” (model, view, controller, etc...)

1. Able to search developer who can write Ruby.

2. Able to search developer who can write Ruby and speaks Japanese.

3. Able to search developer who can write Ruby and JavaScript and speaks
Japanese.

* Important point is Business Logic and Design. (You don’t need to spend time to
page UI)
* About search result, please display followings information with list style. (* You can
change UI if you want)

email | programming_languages | languages
----------------|--------------------------|-------------
foo@example.com | ruby, javascript, python | ja
bar@example.com | ruby, javascript, scala | en, ja

* Also, please write unit test of model. And please create a dummy developer’s data
that is associated “programming_languages” and “languages” by Seeder or Rake
task.

> About amount of record, around dozens ~ a hundred should be fine.

## (B) ActiveRecord

* Please write a code for getting Programming Language that anyone never been
used.
* Please write a unit test if you have a time.
* No need UI (view and controller)


## (C) Frontend

* Please create a form for adding/deleting “interviews” on “developers” editing page
without page transition.
* Adding sortable functionality is better If you can.
* Using JavaScript framework such as Vue/React/Angular is better if you can.

## (D) API

* Please create an API for getting developers detail by JSON format.
* Also, associated information such as programming_languages, languages by JSON
format.
* Please write an unit test of the API.
* Please implement this API's response time is within 10 ms even if number of access is
10 at same time and 10 times in a row.
