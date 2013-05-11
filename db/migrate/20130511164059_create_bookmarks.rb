class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.string :url

      t.timestamps
    end

    add_index :bookmarks, :name
  end
end
