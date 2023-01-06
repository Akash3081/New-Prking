class AddColumnToParking < ActiveRecord::Migration[7.0]
  def change
    add_column :parkings, :user_id, :integer
    add_column :parkings, :parking_name, :string
  end
end
