require "test_helper"

class ModeloTest < ActiveSupport::TestCase
  test "should save modelo" do
    modelo = Modelo.new(nombre: "modelo")
    assert modelo.save, "Modelo should be saved"
  end

  test "should not save modelo without name" do
    modelo = Modelo.new
    assert_not modelo.save, "Modelo should not be saved without name"
  end

  test "shouldnt save modelo with same name" do
    modelo = Modelo.new(nombre: "model Y")
    modelo.save
    modelo2 = Modelo.new(nombre: "model Y")
    assert_not modelo2.save, "Modelo should not be saved with same name"
  end

  test "should delete modelo" do
    modelo = Modelo.new(nombre: "modelo")
    modelo.save
    assert modelo.destroy, "Modelo should be deleted"
  end
end
