require "test_helper"

class WeightLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weight_log = weight_logs(:one)
  end

  test "should get index" do
    get weight_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_weight_log_url
    assert_response :success
  end

  test "should create weight_log" do
    assert_difference("WeightLog.count") do
      post weight_logs_url, params: { weight_log: { measured_at: @weight_log.measured_at, user_id: @weight_log.user_id, weight: @weight_log.weight } }
    end

    assert_redirected_to weight_log_url(WeightLog.last)
  end

  test "should show weight_log" do
    get weight_log_url(@weight_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_weight_log_url(@weight_log)
    assert_response :success
  end

  test "should update weight_log" do
    patch weight_log_url(@weight_log), params: { weight_log: { measured_at: @weight_log.measured_at, user_id: @weight_log.user_id, weight: @weight_log.weight } }
    assert_redirected_to weight_log_url(@weight_log)
  end

  test "should destroy weight_log" do
    assert_difference("WeightLog.count", -1) do
      delete weight_log_url(@weight_log)
    end

    assert_redirected_to weight_logs_url
  end
end
