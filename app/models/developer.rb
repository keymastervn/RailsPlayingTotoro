class Developer < ApplicationRecord
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :programming_languages
  has_many :interviews
  validates_presence_of :email

  # def prepare_pl_statement
  #   self.includes(:programming_languages)
  # end

  # def prepare_l_statement
  #   self.includes(:languages)
  # end

  def can_write programming_language
    programming_languages.collect(&:name).include? programming_language
  end

  def can_speak language
    languages.collect(&:code).include? language
  end

end
