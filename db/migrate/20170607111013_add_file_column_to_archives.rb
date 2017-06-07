class AddFileColumnToArchives < ActiveRecord::Migration[5.1]
  def change
    add_column :archives, :file, :string
  end
end
