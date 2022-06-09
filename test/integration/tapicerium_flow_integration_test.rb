require "test_helper"

class TapiceriumFlowTest < ActionDispatch::IntegrationTest
  test "shout get tapicerium" do
    get tapiceria_url
    assert_response :success
  end

  test "can create a tapicerium" do
    get "/tapiceria/new"
    assert_response :success

    post tapiceria_url, params: { tapicerium: { nombre: "cuero negro", precio: 700 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "cuero negro", response.body
  end

  test "create and delete a tapicerium" do
    get "/tapiceria/new"
    assert_response :success

    post tapiceria_url, params: { tapicerium: { nombre: "cuero claro", precio: 700 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "cuero claro", response.body

    delete tapicerium_url(Tapicerium.last)
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end