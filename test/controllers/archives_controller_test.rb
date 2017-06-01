require 'test_helper'

class ArchivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @archive = archives(:one)
  end

  test "should get index" do
    get archives_url
    assert_response :success
  end

  test "should get new" do
    get new_archive_url
    assert_response :success
  end

  test "should create archive" do
    assert_difference('Archive.count') do
      post archives_url, params: { archive: { author_book_reviewed: @archive.author_book_reviewed, backup_number: @archive.backup_number, bilingual_notes: @archive.bilingual_notes, capacity: @archive.capacity, conference_info: @archive.conference_info, copies_printed: @archive.copies_printed, details_of_referenced_book: @archive.details_of_referenced_book, document_type_id: @archive.document_type_id, edition: @archive.edition, english_title: @archive.english_title, french_title: @archive.french_title, illustrations: @archive.illustrations, journal_name: @archive.journal_name, journal_num: @archive.journal_num, journal_vol: @archive.journal_vol, language_id: @archive.language_id, microfiche_info: @archive.microfiche_info, notes: @archive.notes, number: @archive.number, pages: @archive.pages, place_of_publication: @archive.place_of_publication, publisher: @archive.publisher, series_editor: @archive.series_editor, series_name: @archive.series_name, series_number: @archive.series_number, summary: @archive.summary, thesis_type: @archive.thesis_type, title: @archive.title, title_of_book_containing_article: @archive.title_of_book_containing_article, title_of_book_reviewed: @archive.title_of_book_reviewed, university: @archive.university, web_address: @archive.web_address, year: @archive.year } }
    end

    assert_redirected_to archive_url(Archive.last)
  end

  test "should show archive" do
    get archive_url(@archive)
    assert_response :success
  end

  test "should get edit" do
    get edit_archive_url(@archive)
    assert_response :success
  end

  test "should update archive" do
    patch archive_url(@archive), params: { archive: { author_book_reviewed: @archive.author_book_reviewed, backup_number: @archive.backup_number, bilingual_notes: @archive.bilingual_notes, capacity: @archive.capacity, conference_info: @archive.conference_info, copies_printed: @archive.copies_printed, details_of_referenced_book: @archive.details_of_referenced_book, document_type_id: @archive.document_type_id, edition: @archive.edition, english_title: @archive.english_title, french_title: @archive.french_title, illustrations: @archive.illustrations, journal_name: @archive.journal_name, journal_num: @archive.journal_num, journal_vol: @archive.journal_vol, language_id: @archive.language_id, microfiche_info: @archive.microfiche_info, notes: @archive.notes, number: @archive.number, pages: @archive.pages, place_of_publication: @archive.place_of_publication, publisher: @archive.publisher, series_editor: @archive.series_editor, series_name: @archive.series_name, series_number: @archive.series_number, summary: @archive.summary, thesis_type: @archive.thesis_type, title: @archive.title, title_of_book_containing_article: @archive.title_of_book_containing_article, title_of_book_reviewed: @archive.title_of_book_reviewed, university: @archive.university, web_address: @archive.web_address, year: @archive.year } }
    assert_redirected_to archive_url(@archive)
  end

  test "should destroy archive" do
    assert_difference('Archive.count', -1) do
      delete archive_url(@archive)
    end

    assert_redirected_to archives_url
  end
end
