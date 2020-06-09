class AddColumnsToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :first_name, :string
    add_column :teachers, :last_name, :string
    add_column :teachers, :birthdate, :string
    add_column :teachers, :gender, :string
    add_column :teachers, :address, :string
    add_column :teachers, :city, :string
    add_column :teachers, :zip_code, :string
    add_column :teachers, :expertise, :string
  end
end
