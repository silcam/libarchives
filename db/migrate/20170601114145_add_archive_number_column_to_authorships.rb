class AddArchiveNumberColumnToAuthorships < ActiveRecord::Migration[5.1]
  def change
    add_column :authorships, :archive_number, :string
  end
end
