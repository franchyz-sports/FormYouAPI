class AddColumnToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :birthdate, :string
    add_column :admins, :gender, :string
    add_column :admins, :address, :string
    add_column :admins, :city, :string
    add_column :admins, :zip_code, :string
  end
end
