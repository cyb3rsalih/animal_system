class AddInfoToCalves < ActiveRecord::Migration[5.2]
  def change
    add_column :calves, :info, :string
  end
end
