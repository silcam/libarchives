class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|
      t.string :lang_off
      t.string :name
      t.string :french_name
      t.string :ethno
      t.string :alcam
      t.string :alcno
      t.text :alcnotes
      t.text :ethnotes
      t.string :part_of_country

      t.timestamps
    end
  end
end
