class AddAttachmentMotherImageToAnimals < ActiveRecord::Migration[5.2]
  def self.up
    change_table :animals do |t|
      t.attachment :mother_image
    end
  end

  def self.down
    remove_attachment :animals, :mother_image
  end
end
