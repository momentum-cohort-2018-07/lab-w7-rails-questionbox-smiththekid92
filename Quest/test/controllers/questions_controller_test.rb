require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get title:string" do
    get questions_title:string_url
    assert_response :success
  end

  test "should get body:text" do
    get questions_body:text_url
    assert_response :success
  end

  test "should get username:string" do
    get questions_username:string_url
    assert_response :success
  end

  test "should get user_id:integer" do
    get questions_user_id:integer_url
    assert_response :success
  end

end
