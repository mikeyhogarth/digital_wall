class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.text :body
      t.integer :x
      t.integer :y

      t.references :user
      t.references :concept

      t.timestamps
    end
  end
end
