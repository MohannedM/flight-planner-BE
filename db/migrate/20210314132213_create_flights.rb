class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :plane_type
      t.string :origin
      t.string :pnr, :null => true
      t.string :destination
      t.integer :seat_count
      t.integer :reserved_seats, default: 0
      t.string :flight_date

      t.timestamps
    end
  end
end
