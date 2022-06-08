class CreateColors < ActiveRecord::Migration[7.0]
  def change
    create_table :colors do |t|
      t.string :nombre
      t.float :precio

      t.timestamps
    end
  end
end
