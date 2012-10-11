class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      
      t.string :name
      t.string :image_url
      t.text :description
      t.references :presentation
      
      t.timestamps
    end
  end
end
