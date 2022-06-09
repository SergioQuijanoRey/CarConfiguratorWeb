require "test_helper"
class ExtraFlowTest < ActionDispatch::IntegrationTest
  test "should get extras" do
    get extras_url
    assert_response :success
  end

  test "can create an extra" do
    get "/extras/new"
    assert_response :success

    post extras_url, params: { extra: { nombre: "Autopilot", precio: 4000 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "Autopilot", response.body
  end

  test "create and delete an extra" do
    get "/extras/new"
    assert_response :success

    post extras_url, params: { extra: { nombre: "Autopilot", precio: 4000 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "Autopilot", response.body

    delete extra_url(Extra.last)
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end