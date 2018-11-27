class ChangeEarringNoToAnimals < ActiveRecord::Migration[5.2]
  def change
    change_column :animals, :earring_no, :string
  end
end
