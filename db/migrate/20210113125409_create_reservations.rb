class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date "start_day"
      t.date "finish_day"
      t.integer "number"
      t.timestamps
    end
  end
end
