class AddLogoToClient < ActiveRecord::Migration
  def change
      add_attachment :clients, :logo
  end
end
