require "test_helper"

class TapiceriumTest < ActiveSupport::TestCase
  test "should save tapicerium" do
    tapicerium = Tapicerium.new(nombre: "tapicerium")
    assert tapicerium.save, "Tapicerium should be saved"
  end

  test "should not save tapicerium without name" do
    tapicerium = Tapicerium.new
    assert_not tapicerium.save, "Tapicerium should not be saved without name"
  end

  test "shouldnt save tapicerium with same name" do
    tapicerium = Tapicerium.new(nombre: "cuero")
    tapicerium.save
    tapicerium2 = Tapicerium.new(nombre: "cuero")
    assert_not tapicerium2.save, "Tapicerium should not be saved with same name"
  end

  test "should delete tapicerium" do
    tapicerium = Tapicerium.new(nombre: "tapicerium")
    tapicerium.save
    assert tapicerium.destroy, "Tapicerium should be deleted"
  end
end
