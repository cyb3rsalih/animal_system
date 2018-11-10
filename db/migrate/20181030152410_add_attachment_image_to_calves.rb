class AddAttachmentImageToCalves < ActiveRecord::Migration[5.2]
  def self.up
    change_table :calves do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :calves, :image
  end
end
