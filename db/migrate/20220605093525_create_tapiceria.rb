class CreateTapiceria < ActiveRecord::Migration[7.0]
  def change
    create_table :tapiceria do |t|
      t.string :nombre
      t.float :precio

      t.timestamps
    end
  end
end
