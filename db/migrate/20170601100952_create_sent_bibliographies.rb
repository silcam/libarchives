class CreateSentBibliographies < ActiveRecord::Migration[5.1]
  def change
    create_table :sent_bibliographies do |t|
      t.references :archive, foreign_key: true
      t.string :archive_number
      t.references :destination, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
