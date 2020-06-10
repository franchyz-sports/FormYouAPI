class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.belongs_to :creator, index: true, foreign_key: {to_table: :admins}
      t.timestamps
    end
  end
end
