class Author < ApplicationRecord
  has_many :authorships
  has_many :archives, through: :authorships

  def surname_and_first
    "#{surname}, #{initials}"
  end
end
