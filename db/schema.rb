# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170605132810) do

  create_table "archives", force: :cascade do |t|
    t.string "number"
    t.integer "document_type_id"
    t.string "backup_number"
    t.string "capacity"
    t.integer "year"
    t.string "title"
    t.string "english_title"
    t.string "french_title"
    t.string "title_of_book_reviewed"
    t.string "author_book_reviewed"
    t.string "journal_name"
    t.string "journal_vol"
    t.string "journal_num"
    t.string "title_of_book_containing_article"
    t.string "details_of_referenced_book"
    t.string "series_editor"
    t.string "series_name"
    t.string "series_number"
    t.string "place_of_publication"
    t.string "publisher"
    t.string "thesis_type"
    t.string "university"
    t.string "conference_info"
    t.string "pages"
    t.string "edition"
    t.string "copies_printed"
    t.string "illustrations"
    t.text "summary"
    t.integer "language_id"
    t.string "bilingual_notes"
    t.string "microfiche_info"
    t.text "notes"
    t.string "web_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_type_id"], name: "index_archives_on_document_type_id"
    t.index ["language_id"], name: "index_archives_on_language_id"
  end

  create_table "archives_categories", id: false, force: :cascade do |t|
    t.integer "archive_id"
    t.integer "category_id"
    t.string "archive_number"
    t.index ["archive_id"], name: "index_archives_categories_on_archive_id"
    t.index ["category_id"], name: "index_archives_categories_on_category_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "surname"
    t.string "initials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authorships", force: :cascade do |t|
    t.integer "author_id"
    t.integer "archive_id"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "archive_number"
    t.index ["archive_id"], name: "index_authorships_on_archive_id"
    t.index ["author_id"], name: "index_authorships_on_author_id"
  end

  create_table "bibliography_styles", force: :cascade do |t|
    t.integer "standard"
    t.integer "document_type_id"
    t.integer "field_id"
    t.integer "sequence"
    t.string "format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_type_id"], name: "index_bibliography_styles_on_document_type_id"
    t.index ["field_id"], name: "index_bibliography_styles_on_field_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries_languages", id: false, force: :cascade do |t|
    t.integer "country_id"
    t.integer "language_id"
    t.index ["country_id"], name: "index_countries_languages_on_country_id"
    t.index ["language_id"], name: "index_countries_languages_on_language_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.string "french_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "lang_off"
    t.string "name"
    t.string "french_name"
    t.string "ethno"
    t.string "alcam"
    t.string "alcno"
    t.text "alcnotes"
    t.text "ethnotes"
    t.string "part_of_country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passwords", force: :cascade do |t|
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sent_bibliographies", force: :cascade do |t|
    t.integer "archive_id"
    t.string "archive_number"
    t.integer "destination_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["archive_id"], name: "index_sent_bibliographies_on_archive_id"
    t.index ["destination_id"], name: "index_sent_bibliographies_on_destination_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

end
