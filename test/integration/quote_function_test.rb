require 'test_helper'

class QuoteFunctionTest < ActionDispatch::IntegrationTest
  fixtures :all 
  test "should create quote and redirect to root" do
=begin
    get new_path
    assert_response :success
    assert_template 'new'
    
    post new_path, :quote => "bbbbbbbbbbb"
#not sure how to simulate create or clicking the button.
    assert_response :redirect
    assert_redirect_to root_path

    follow_redirect!

    assert_response :success
    assert_template 'index'
    
  end
=end

  test "should go from main page to picture page" do
    get root_path
    assert_response :success
    assert_template 'index'
#not sure what to do here.

  end

end
