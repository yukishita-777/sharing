class CreateRoomReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :room_reservations do |t|
      t.integer :room_id
      t.integer :reservation_id
      t.timestamps
    end
  end
end
