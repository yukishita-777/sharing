class RemoveRoomIdFromRoomReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :room_reservations, :room_id, :integer
  end
end
