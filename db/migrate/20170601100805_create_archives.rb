class CreateArchives < ActiveRecord::Migration[5.1]
  def change
    create_table :archives do |t|
      t.string :number
      t.references :document_type, foreign_key: true
      t.string :backup_number
      t.string :capacity
      t.integer :year
      t.string :title
      t.string :english_title
      t.string :french_title
      t.string :title_of_book_reviewed
      t.string :author_book_reviewed
      t.string :journal_name
      t.string :journal_vol
      t.string :journal_num
      t.string :title_of_book_containing_article
      t.string :details_of_referenced_book
      t.string :series_editor
      t.string :series_name
      t.string :series_number
      t.string :place_of_publication
      t.string :publisher
      t.string :thesis_type
      t.string :university
      t.string :conference_info
      t.string :pages
      t.string :edition
      t.string :copies_printed
      t.string :illustrations
      t.text :summary
      t.references :language, foreign_key: true
      t.string :bilingual_notes
      t.string :microfiche_info
      t.text :notes
      t.string :web_address

      t.timestamps
    end
  end
end
