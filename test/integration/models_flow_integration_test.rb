
require "test_helper"
class ModelFlowTest < ActionDispatch::IntegrationTest
  test "should get models" do
    get modelos_url
    assert_response :success
  end

  test "can create a model" do
    get "/modelos/new"
    assert_response :success

    post modelos_url, params: { modelo: { nombre: "model b", precio: 10000 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "model b", response.body
  end

  test "create and delete a model" do
    get "/modelos/new"
    assert_response :success

    post modelos_url, params: { modelo: { nombre: "model b", precio: 10000 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "model b", response.body

    delete modelo_url(Modelo.last)
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end