require 'test_helper'

class FuriasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get furias_index_url
    assert_response :success
  end

end
