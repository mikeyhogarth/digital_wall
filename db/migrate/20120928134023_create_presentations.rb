class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :name
      t.text :description
      t.integer :client_id

      t.timestamps
    end
  end
end
