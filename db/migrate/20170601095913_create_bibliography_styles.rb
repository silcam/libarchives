class CreateBibliographyStyles < ActiveRecord::Migration[5.1]
  def change
    create_table :bibliography_styles do |t|
      t.integer :standard
      t.references :document_type, foreign_key: true
      t.references :field, foreign_key: true
      t.integer :sequence
      t.string :format

      t.timestamps
    end
  end
end
