class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :surname
      t.string :initials

      t.timestamps
    end
  end
end
