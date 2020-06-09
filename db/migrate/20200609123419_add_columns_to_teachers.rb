class AddColumnsToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :first_name, :string
    add_column :teachers, :last_name, :string
    add_column :teachers, :birthdate, :string
    add_column :teachers, :adress, :string
    add_column :teachers, :city, :string
    add_column :teachers, :zipcode, :string
    add_column :teachers, :expertise, :string
  end
end
