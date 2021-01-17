class DestroyRoomReservation < ActiveRecord::Migration[6.0]
  def change
    drop_table :room_reservations
  end
end
