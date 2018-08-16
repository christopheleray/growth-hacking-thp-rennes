require 'test_helper'

class StaticsPagesControllerTest < ActionDispatch::IntegrationTest
  test 'Should get the root page' do
    get root_url
    assert_response :success
  end
  
  test 'Should get the twitter landing page' do
    get twitter_url
    assert_response :success
  end

  test 'Should get the facebook landing page' do
    get facebook_url
    assert_response :success
  end
end
