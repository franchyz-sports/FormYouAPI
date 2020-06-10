class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.integer :max_student
      t.date :date
      t.belongs_to :formation, index: true
      t.belongs_to :creator, index: true, foreign_key: {to_table: :admins}
      t.belongs_to :room, index: true
      t.timestamps
    end
  end
end
