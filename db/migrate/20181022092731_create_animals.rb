class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :state
      t.integer :earring_no
      t.string :picture
      t.date :mating_date
      t.string :gender
      t.integer :mother_earring_no
      t.date :birthdate
      t.string :picture_of_mother

      t.timestamps
    end
  end
end
