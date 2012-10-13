class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      
      t.string :name
      t.text :description
      t.references :presentation
      
      t.timestamps
    end
  end
end
