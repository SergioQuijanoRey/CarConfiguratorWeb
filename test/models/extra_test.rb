require "test_helper"

class ExtraTest < ActiveSupport::TestCase
  test "should save extra" do
    extra = Extra.new(nombre: "red")
    assert extra.save, "Extra should be saved"
  end

  test "should not save extra without name" do
    extra = Extra.new
    assert_not extra.save, "Extra should not be saved without name"
  end

  test "shouldnt save extra with same name" do
    extra = Extra.new(nombre: "screen")
    extra.save
    extra2 = Extra.new(nombre: "screen")
    assert_not extra2.save, "Extra should not be saved with same name"
  end

  test "should delete extra" do
    extra = Extra.new(nombre: "red")
    extra.save
    assert extra.destroy, "Extra should be deleted"
  end
end
