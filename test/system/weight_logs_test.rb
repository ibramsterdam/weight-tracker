require "application_system_test_case"

class WeightLogsTest < ApplicationSystemTestCase
  setup do
    @weight_log = weight_logs(:one)
  end

  test "visiting the index" do
    visit weight_logs_url
    assert_selector "h1", text: "Weight logs"
  end

  test "should create weight log" do
    visit weight_logs_url
    click_on "New weight log"

    fill_in "Measured at", with: @weight_log.measured_at
    fill_in "User", with: @weight_log.user_id
    fill_in "Weight", with: @weight_log.weight
    click_on "Create Weight log"

    assert_text "Weight log was successfully created"
    click_on "Back"
  end

  test "should update Weight log" do
    visit weight_log_url(@weight_log)
    click_on "Edit this weight log", match: :first

    fill_in "Measured at", with: @weight_log.measured_at
    fill_in "User", with: @weight_log.user_id
    fill_in "Weight", with: @weight_log.weight
    click_on "Update Weight log"

    assert_text "Weight log was successfully updated"
    click_on "Back"
  end

  test "should destroy Weight log" do
    visit weight_log_url(@weight_log)
    click_on "Destroy this weight log", match: :first

    assert_text "Weight log was successfully destroyed"
  end
end
