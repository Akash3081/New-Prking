class CreateParkings < ActiveRecord::Migration[7.0]
  def change
    create_table :parkings do |t|
      t.string :maximum_size
      t.string :security_provision
      t.string :parking_duration
      t.string :chance_to_get_parking
      t.string :parking_cost_per_hour
      t.string :average_departure_time
      t.string :type_of_parking_facility
      t.string :type_of_security
      t.string :distance_to_supermarket
      t.string :distance_from_stores
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
