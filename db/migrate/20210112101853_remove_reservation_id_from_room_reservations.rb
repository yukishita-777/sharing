class RemoveReservationIdFromRoomReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :room_reservations, :reservation_id, :integer
  end
end
