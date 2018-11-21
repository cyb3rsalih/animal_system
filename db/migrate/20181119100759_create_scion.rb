class CreateScion < ActiveRecord::Migration[5.2]
  def change
    create_table :scions do |t|
      t.string :name
      t.date :scion_date
    end
  end
end
