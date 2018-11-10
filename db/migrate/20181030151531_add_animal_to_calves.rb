class AddAnimalToCalves < ActiveRecord::Migration[5.2]
  def change
    add_reference :calves, :animal, foreign_key: true
  end
end
