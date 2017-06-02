class Archive < ApplicationRecord
  belongs_to :document_type
  belongs_to :language
  has_many :sent_bibliographies
  has_many :authorships
  has_many :authors, through: :authorships
  has_and_belongs_to_many :categories

  def document_type_name
    document_type.name if document_type
  end

  def language_name
    language.name if language
  end

  def search query
    fields = [:title, :english_title, :french_title]
  end
end
