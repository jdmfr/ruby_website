require 'test_helper'

class CollectLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collect_line = collect_lines(:one)
  end

  test "should get index" do
    get collect_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_collect_line_url
    assert_response :success
  end

  test "should create collect_line" do
    assert_difference('CollectLine.count') do
      post collect_lines_url, params: { collect_line: {  } }
    end

    assert_redirected_to collect_line_url(CollectLine.last)
  end

  test "should show collect_line" do
    get collect_line_url(@collect_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_collect_line_url(@collect_line)
    assert_response :success
  end

  test "should update collect_line" do
    patch collect_line_url(@collect_line), params: { collect_line: {  } }
    assert_redirected_to collect_line_url(@collect_line)
  end

  test "should destroy collect_line" do
    assert_difference('CollectLine.count', -1) do
      delete collect_line_url(@collect_line)
    end

    assert_redirected_to collect_lines_url
  end
end
