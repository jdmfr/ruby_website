require "application_system_test_case"

class CollectLinesTest < ApplicationSystemTestCase
  setup do
    @collect_line = collect_lines(:one)
  end

  test "visiting the index" do
    visit collect_lines_url
    assert_selector "h1", text: "Collect Lines"
  end

  test "creating a Collect line" do
    visit collect_lines_url
    click_on "New Collect Line"

    click_on "Create Collect line"

    assert_text "Collect line was successfully created"
    click_on "Back"
  end

  test "updating a Collect line" do
    visit collect_lines_url
    click_on "Edit", match: :first

    click_on "Update Collect line"

    assert_text "Collect line was successfully updated"
    click_on "Back"
  end

  test "destroying a Collect line" do
    visit collect_lines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collect line was successfully destroyed"
  end
end
