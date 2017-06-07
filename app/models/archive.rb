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

  def after_save(new_author_ids, file)
    update_authorships new_author_ids
    save_upload file
  end

  def save_upload(uploaded_io)
    unless uploaded_io.blank?
      filename = Rails.root.join('public', 'uploads', 'archives', id.to_s)
      File.open(filename, 'wb') do |file|
        file.write(uploaded_io.read)
      end
      update file: "/uploads/archives/#{id}"
    end
  end

  def update_authorships(new_author_ids)
    new_author_ids.delete('')
    new_author_ids.uniq!
    remove_old_authorships new_author_ids
    add_new_authorships new_author_ids
  end

  def remove_old_authorships(new_author_ids)
    authorships.each do |authorship|
      authorship.destroy unless new_author_ids.include? authorship.author_id
    end
  end

  def add_new_authorships(new_author_ids)
    new_author_ids.each.with_index(1) do |new_author_id, index|
      existing_authorship = authorships.find_by(author_id: new_author_id)
      if existing_authorship
        existing_authorship.update(priority: index) if existing_authorship.priority != index
      else
        authorships.create(author_id: new_author_id, priority: index)
      end
    end
  end


  def to_s
    title
  end
end
