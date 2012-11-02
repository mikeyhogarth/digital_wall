class AddActiveCheckboxToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :active, :boolean
  end
end
