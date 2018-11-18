class CreateVaccinate < ActiveRecord::Migration[5.2]
  def change
    create_table :vaccinates do |t|
      t.string :name
      t.references :animal, foreign_key: true
      t.date :vaccinate_date
    end
  end
end
