class AddEarringNoToCalves < ActiveRecord::Migration[5.2]
  def change
    add_column :calves, :earring_no, :string
    add_column :calves, :birthdate, :date
  end
end
