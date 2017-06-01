class ArchivesCategoriesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :archives_categories, id: false do |t|
      t.belongs_to :archive
      t.belongs_to :category
    end
  end
end
