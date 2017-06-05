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

  def self.search query


    fields = %w[archives.title archives.english_title archives.french_title authors.surname authors.initials
                languages.name archives.journal_name archives.title_of_book_reviewed
                archives.author_book_reviewed archives.title_of_book_containing_article
                archives.series_name archives.place_of_publication archives.publisher
                archives.university]
    archives = []
    fields.each do |field|
      Archive.joins(:authors).joins(:language).where("#{field} LIKE ?", "%#{query}%").each do |a|
        archives << a unless archives.include? a
      end
    end
    archives
  end

  def to_s
    title
  end
end
