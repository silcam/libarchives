class Language < ApplicationRecord
  has_many :archives
  has_and_belongs_to_many :countries
end
