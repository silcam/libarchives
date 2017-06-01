class Author < ApplicationRecord
  has_many :authorships
  has_many :archives, through: :authorships
end
