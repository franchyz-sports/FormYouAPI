class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.integer     :note
      t.boolean     :presence
      t.belongs_to  :student
      # t.belongs_to  :session
      t.timestamps
    end
  end
end
