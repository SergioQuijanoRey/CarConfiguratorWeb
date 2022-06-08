require "application_system_test_case"

class ExtrasTest < ApplicationSystemTestCase
  setup do
    @extra = extras(:one)
  end

  test "visiting the index" do
    visit extras_url
    assert_selector "h1", text: "Extras"
  end

  test "should create extra" do
    visit extras_url
    click_on "New extra"

    fill_in "Nombre", with: @extra.nombre
    fill_in "Precio", with: @extra.precio
    click_on "Create Extra"

    assert_text "Extra was successfully created"
    click_on "Back"
  end

  test "should update Extra" do
    visit extra_url(@extra)
    click_on "Edit this extra", match: :first

    fill_in "Nombre", with: @extra.nombre
    fill_in "Precio", with: @extra.precio
    click_on "Update Extra"

    assert_text "Extra was successfully updated"
    click_on "Back"
  end

  test "should destroy Extra" do
    visit extra_url(@extra)
    click_on "Destroy this extra", match: :first

    assert_text "Extra was successfully destroyed"
  end
end
