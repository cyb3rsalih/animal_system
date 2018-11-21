class DropVaccinate < ActiveRecord::Migration[5.2]
  def change
    drop_table :vaccinates
  end
end
