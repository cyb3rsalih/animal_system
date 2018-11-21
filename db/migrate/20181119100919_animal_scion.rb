class AnimalScion < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_scions do |t|
      t.belongs_to :animal, index: true
      t.belongs_to :scion, index: true
      t.timestamps
    end
  end
end
