class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.string :mac_address

      t.timestamps
    end
  end
end
