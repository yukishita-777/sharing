class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :name
      t.text :introduction
      t.integer :fee
      t.text :address
      t.string :image
      t.timestamps
    end
  end
end
