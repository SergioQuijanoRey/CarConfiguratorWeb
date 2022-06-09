require "test_helper"

class ColorFlowTest < ActionDispatch::IntegrationTest
  test "should get colors" do
    get colors_url
    assert_response :success
  end

  test "can create a color" do
    get "/colors/new"
    assert_response :success


    post colors_url, params: { color: { nombre: "yellow", precio: 300 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "yellow", response.body
  end

  test "create and delete a color" do
    get "/colors/new"
    assert_response :success

    post colors_url, params: { color: { nombre: "grey", precio: 300 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "grey", response.body

    delete color_url(Color.last)
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end