require 'test_helper'

class TimeLimitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_limit = time_limits(:one)
  end

  test 'should get index' do
    get time_limits_url
    assert_response :success
  end

  test 'should get new' do
    get new_time_limit_url
    assert_response :success
  end

  test 'should create time_limit' do
    assert_difference('TimeLimit.count') do
      post time_limits_url, params: { time_limit: { end_time: @time_limit.end_time, service_id: @time_limit.service_id, start_time: @time_limit.start_time, user_id: @time_limit.user_id } }
    end

    assert_redirected_to time_limit_url(TimeLimit.last)
  end

  test 'should show time_limit' do
    get time_limit_url(@time_limit)
    assert_response :success
  end

  test 'should get edit' do
    get edit_time_limit_url(@time_limit)
    assert_response :success
  end

  test 'should update time_limit' do
    patch time_limit_url(@time_limit), params: { time_limit: { end_time: @time_limit.end_time, service_id: @time_limit.service_id, start_time: @time_limit.start_time, user_id: @time_limit.user_id } }
    assert_redirected_to time_limit_url(@time_limit)
  end

  test 'should destroy time_limit' do
    assert_difference('TimeLimit.count', -1) do
      delete time_limit_url(@time_limit)
    end

    assert_redirected_to time_limits_url
  end
end
