class CreateFormations < ActiveRecord::Migration[6.0]
  def change
    create_table :formations do |t|
      t.string :title
      t.text :description
      # t.belongs_to :teacher
      # t.belongs_to :admin
      t.timestamps
    end

    # create_table :formations_categories, id: false do |t|
    #   t.belongs_to :formation
    #   t.belongs_to :category
    # end

    create_table :formations_students, id: false do |t|
      t.belongs_to :formation
      t.belongs_to :student
    end
  end
end
