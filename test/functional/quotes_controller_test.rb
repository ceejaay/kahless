require 'test_helper'

class QuotesControllerTest < ActionController::TestCase

  setup do
#this comes from the yaml fixture file
    @quote = quotes(:kahless_quote)
    #@quote = Quote.create!(text: "hello world!!!!", authorized: true)
  end

  test "should get index" do
    get :index
    assert_response :success
#I think this looks for the right view file?
    assert_template 'index'
    assert_not_nil assigns(:quote)

  end

  test "should get new" do
#you have to use RESTful verbs to get the pages.
    get :new
    assert :success
  end


  test "should create quote" do
    assert_difference('Quote.count') do
#this next line invokes the RESTful verb post.
#it has to have the right input params. in the right format.
      post :create, :quote => { text: "blergy blergy blergy"}
    end
    assert_response :redirect
    assert_redirected_to root_path
  end
  
  test "should update quote" do
    put :update, :id  => @quote.to_param, :quote => {:authorized => true}
  end
  
  test "should destroy quote" do
    assert_nothing_raised {Quote.find(@quote.to_param)}
    assert_difference('Quote.count', -1) do
      delete :destroy, :id => @quote.to_param

    end
    assert_raise(ActiveRecord::RecordNotFound) {Quote.find(@article.to_param)}
  end
  
  test "Should get picture page" do
    get :picture
    assert_response :success
    assert_template 'picture'
  end

  test "Should get test page" do
    get :test_page
    assert_response :success
    assert_template 'test_page'
  end
  
#this needs the login helper. How to do this with devise?
  test "should get admin page" do
    get :admin_page
#this part is failiing.
    assert_response :success
  end
  

end
