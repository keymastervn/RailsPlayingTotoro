class Language < ApplicationRecord
  has_and_belongs_to_many :developers
  validates_presence_of :code

end
