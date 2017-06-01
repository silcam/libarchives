class AddArchiveNumberColumnToArchivesCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :archives_categories, :archive_number, :string
  end
end
