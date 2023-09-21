require "test_helper"

class ExamplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @example = examples(:one)
  end

  test "should get index" do
    get examples_url, as: :json
    assert_response :success
  end

  test "should create example" do
    assert_difference("Example.count") do
      post examples_url, params: { example: { gender: @example.gender, name: @example.name } }, as: :json
    end

    assert_response :created
  end

  test "should show example" do
    get example_url(@example), as: :json
    assert_response :success
  end

  test "should update example" do
    patch example_url(@example), params: { example: { gender: @example.gender, name: @example.name } }, as: :json
    assert_response :success
  end

  test "should destroy example" do
    assert_difference("Example.count", -1) do
      delete example_url(@example), as: :json
    end

    assert_response :no_content
  end
end
