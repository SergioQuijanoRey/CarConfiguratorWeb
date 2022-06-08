require "test_helper"

class TapiceriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tapicerium = tapiceria(:one)
  end

  test "should get index" do
    get tapiceria_url
    assert_response :success
  end

  test "should get new" do
    get new_tapicerium_url
    assert_response :success
  end

  test "should create tapicerium" do
    assert_difference("Tapicerium.count") do
      post tapiceria_url, params: { tapicerium: { nombre: @tapicerium.nombre, precio: @tapicerium.precio } }
    end

    assert_redirected_to tapicerium_url(Tapicerium.last)
  end

  test "should show tapicerium" do
    get tapicerium_url(@tapicerium)
    assert_response :success
  end

  test "should get edit" do
    get edit_tapicerium_url(@tapicerium)
    assert_response :success
  end

  test "should update tapicerium" do
    patch tapicerium_url(@tapicerium), params: { tapicerium: { nombre: @tapicerium.nombre, precio: @tapicerium.precio } }
    assert_redirected_to tapicerium_url(@tapicerium)
  end

  test "should destroy tapicerium" do
    assert_difference("Tapicerium.count", -1) do
      delete tapicerium_url(@tapicerium)
    end

    assert_redirected_to tapiceria_url
  end
end
