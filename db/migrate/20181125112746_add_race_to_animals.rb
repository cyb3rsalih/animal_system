class AddRaceToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :race, :string 
  end
end
