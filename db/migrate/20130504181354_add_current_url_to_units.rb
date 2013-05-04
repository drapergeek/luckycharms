class AddCurrentUrlToUnits < ActiveRecord::Migration
  def change
    add_column :units, :current_url, :text
  end
end
