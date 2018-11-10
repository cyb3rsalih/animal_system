class ChangeTypeNameToAnimals < ActiveRecord::Migration[5.2]
  def change
    change_column :animals, :type, :animal_type
  end
end
