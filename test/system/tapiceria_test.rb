require "application_system_test_case"

class TapiceriaTest < ApplicationSystemTestCase
  setup do
    @tapicerium = tapiceria(:one)
  end

  test "visiting the index" do
    visit tapiceria_url
    assert_selector "h1", text: "Tapiceria"
  end

  test "should create tapicerium" do
    visit tapiceria_url
    click_on "New tapicerium"

    fill_in "Nombre", with: @tapicerium.nombre
    fill_in "Precio", with: @tapicerium.precio
    click_on "Create Tapicerium"

    assert_text "Tapicerium was successfully created"
    click_on "Back"
  end

  test "should update Tapicerium" do
    visit tapicerium_url(@tapicerium)
    click_on "Edit this tapicerium", match: :first

    fill_in "Nombre", with: @tapicerium.nombre
    fill_in "Precio", with: @tapicerium.precio
    click_on "Update Tapicerium"

    assert_text "Tapicerium was successfully updated"
    click_on "Back"
  end

  test "should destroy Tapicerium" do
    visit tapicerium_url(@tapicerium)
    click_on "Destroy this tapicerium", match: :first

    assert_text "Tapicerium was successfully destroyed"
  end
end
