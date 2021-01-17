class AddReservationTotalAmountToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :reservation_amount_total, :integer
  end
end
