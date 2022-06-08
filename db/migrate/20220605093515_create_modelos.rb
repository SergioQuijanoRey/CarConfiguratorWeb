class CreateModelos < ActiveRecord::Migration[7.0]
  def change
    create_table :modelos do |t|
      t.string :nombre
      t.float :precio

      t.timestamps
    end
  end
end
