
# Migracion para crear la base de datos donde almacenamos los usuarios del sistema
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :mail
      t.integer :password
      t.string :role

      t.timestamps
    end
  end
end
