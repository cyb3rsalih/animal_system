class ChangeMotherEarringToToAnimal < ActiveRecord::Migration[5.2]
  def change
    change_column :animals, :mother_earring_no, :string
  end
end
