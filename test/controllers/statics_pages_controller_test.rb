require 'test_helper'

class StaticsPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get statics_pages_index_url
    assert_response :success
  end

end
