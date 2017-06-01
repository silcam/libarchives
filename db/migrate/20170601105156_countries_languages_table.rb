class CountriesLanguagesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :countries_languages, id: false do |t|
      t.belongs_to :country
      t.belongs_to :language
    end
  end
end
