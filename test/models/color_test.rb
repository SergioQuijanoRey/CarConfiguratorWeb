require "test_helper"

class ColorTest < ActiveSupport::TestCase
  test "should save color" do
    color = Color.new(nombre: "newcolor")
    assert color.save, "Color should be saved"
  end
  
  test "should not save color without name" do
    color = Color.new
    assert_not color.save, "Color should not be saved without name"
  end

  test "shouldnt save color with same name" do
    color = Color.new(nombre: "green")
    color.save
    color2 = Color.new(nombre: "green")
    assert_not color2.save, "Color should not be saved with same name"
  end

  test "should delete color" do
    color = Color.new(nombre: "red")
    color.save
    assert color.destroy, "Color should be deleted"
  end
end
