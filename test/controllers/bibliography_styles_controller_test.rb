require 'test_helper'

class BibliographyStylesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bibliography_style = bibliography_styles(:one)
  end

  test "should get index" do
    get bibliography_styles_url
    assert_response :success
  end

  test "should get new" do
    get new_bibliography_style_url
    assert_response :success
  end

  test "should create bibliography_style" do
    assert_difference('BibliographyStyle.count') do
      post bibliography_styles_url, params: { bibliography_style: { document_type_id: @bibliography_style.document_type_id, field_id: @bibliography_style.field_id, format: @bibliography_style.format, sequence: @bibliography_style.sequence, standard: @bibliography_style.standard } }
    end

    assert_redirected_to bibliography_style_url(BibliographyStyle.last)
  end

  test "should show bibliography_style" do
    get bibliography_style_url(@bibliography_style)
    assert_response :success
  end

  test "should get edit" do
    get edit_bibliography_style_url(@bibliography_style)
    assert_response :success
  end

  test "should update bibliography_style" do
    patch bibliography_style_url(@bibliography_style), params: { bibliography_style: { document_type_id: @bibliography_style.document_type_id, field_id: @bibliography_style.field_id, format: @bibliography_style.format, sequence: @bibliography_style.sequence, standard: @bibliography_style.standard } }
    assert_redirected_to bibliography_style_url(@bibliography_style)
  end

  test "should destroy bibliography_style" do
    assert_difference('BibliographyStyle.count', -1) do
      delete bibliography_style_url(@bibliography_style)
    end

    assert_redirected_to bibliography_styles_url
  end
end
