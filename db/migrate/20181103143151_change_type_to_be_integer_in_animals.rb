class ChangeTypeToBeIntegerInAnimals < ActiveRecord::Migration[5.2]
  def change
    change_column :animals, :type, 'integer USING CAST(type AS integer)'
  end
end
