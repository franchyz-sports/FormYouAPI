class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.belongs_to :creator, index: true, foreign_key: {to_table: :admins}
      t.timestamps
    end

    create_table :categories_formations, id: false do |t|
      t.belongs_to :category
      t.belongs_to :formation
    end
  end
end
