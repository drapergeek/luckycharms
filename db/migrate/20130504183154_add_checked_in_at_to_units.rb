class AddCheckedInAtToUnits < ActiveRecord::Migration
  def change
    add_column :units, :last_checked_in_at, :timestamp
  end
end
