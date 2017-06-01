class Archive < ApplicationRecord
  belongs_to :document_type
  belongs_to :language
  has_many :sent_bibliographies
  has_many :authorships
  has_many :authors, through: :authorships
  has_and_belongs_to_many :categories
end
