class Archive < ApplicationRecord
  extend LabelWriter

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
      path = "/uploads/archives/#{id}#{extract_extension(uploaded_io.original_filename)}"
      File.open(full_path(path), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      delete_old_file path
      update file: path
    end
  end

  def delete_old_file new_path
    if !file.blank? &&
        file != new_path &&
        File.exist?(full_path(file))

      File.delete full_path(file)
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

  def extract_extension filename
    filename.include?('.') ? filename[filename.rindex('.'), filename.length-1] : ''
  end

  def full_path path
    Rails.root.join('public'+path)
  end

  def to_s
    title
  end

  def self.labels_for(filename, archive_ids)
    archives = Archive.where "id IN (?)", archive_ids
    labels =archives.map do |archive|
      title1 = archive.title
      title2 = (archive.title != archive.english_title && !archive.english_title.blank?) ?
                   archive.english_title :
                   archive.french_title
      authors = archive.authors.map{ |a| a.surname }.join(', ')
      {title1: title1, title2: title2, authors: authors, year: archive.year, number: archive.number}
    end
    generate_labels filename, labels
  end
end
