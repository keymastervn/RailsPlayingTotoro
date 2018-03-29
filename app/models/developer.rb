class Developer < ApplicationRecord
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :programming_languages
  has_many :interviews
end
