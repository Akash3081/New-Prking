class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.string :colour
      t.string :car_number
      t.string :car_owner
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
