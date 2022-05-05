
# Modelo para la clase Usuario
class User < ApplicationRecord

  # Todos los campos del formulario son obligatorios salvo el email
  validates_presence_of :username
  validates_presence_of :password
  validates_presence_of :role

end
