class CreateAuthorships < ActiveRecord::Migration[5.1]
  def change
    create_table :authorships do |t|
      t.references :author, foreign_key: true
      t.references :archive, foreign_key: true
      t.integer :priority

      t.timestamps
    end
  end
end
