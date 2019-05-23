class RenamePetIdToDogIdInEmployees < ActiveRecord::Migration[5.1]
  def change
    rename_column :employees, :pet_id, :dog_id
  end
end
