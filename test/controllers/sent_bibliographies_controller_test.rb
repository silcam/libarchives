require 'test_helper'

class SentBibliographiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sent_bibliography = sent_bibliographies(:one)
  end

  test "should get index" do
    get sent_bibliographies_url
    assert_response :success
  end

  test "should get new" do
    get new_sent_bibliography_url
    assert_response :success
  end

  test "should create sent_bibliography" do
    assert_difference('SentBibliography.count') do
      post sent_bibliographies_url, params: { sent_bibliography: { archive_id: @sent_bibliography.archive_id, archive_number: @sent_bibliography.archive_number, date: @sent_bibliography.date, destination_id: @sent_bibliography.destination_id } }
    end

    assert_redirected_to sent_bibliography_url(SentBibliography.last)
  end

  test "should show sent_bibliography" do
    get sent_bibliography_url(@sent_bibliography)
    assert_response :success
  end

  test "should get edit" do
    get edit_sent_bibliography_url(@sent_bibliography)
    assert_response :success
  end

  test "should update sent_bibliography" do
    patch sent_bibliography_url(@sent_bibliography), params: { sent_bibliography: { archive_id: @sent_bibliography.archive_id, archive_number: @sent_bibliography.archive_number, date: @sent_bibliography.date, destination_id: @sent_bibliography.destination_id } }
    assert_redirected_to sent_bibliography_url(@sent_bibliography)
  end

  test "should destroy sent_bibliography" do
    assert_difference('SentBibliography.count', -1) do
      delete sent_bibliography_url(@sent_bibliography)
    end

    assert_redirected_to sent_bibliographies_url
  end
end
