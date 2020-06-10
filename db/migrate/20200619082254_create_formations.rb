class CreateFormations < ActiveRecord::Migration[6.0]
  def change
    create_table :formations do |t|
      t.string :title
      t.text :description
      t.belongs_to :room
      t.belongs_to :teacher
      t.belongs_to :creator, index: true, foreign_key: {to_table: :admins}
      t.timestamps
    end
  end
end
