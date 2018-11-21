class AddTimestampsToScions < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :scions, null: true

  # backfill existing record with created_at and updated_at
  # values making clear that the records are faked
  long_ago = DateTime.new(2000, 1, 1)
  Scion.update_all(created_at: long_ago, updated_at: long_ago)

  # change not null constraints
  change_column_null :scions, :created_at, false
  change_column_null :scions, :updated_at, false
  end
end
