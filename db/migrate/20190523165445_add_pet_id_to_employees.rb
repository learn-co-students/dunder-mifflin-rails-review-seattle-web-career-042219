class AddPetIdToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :pet_id, :integer
  end
end
