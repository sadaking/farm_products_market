require 'test_helper'

class MessageTopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get message_tops_index_url
    assert_response :success
  end

end
