class AddAttachmentToConcepts < ActiveRecord::Migration
  def change
    add_attachment :concepts, :image
  end
end
