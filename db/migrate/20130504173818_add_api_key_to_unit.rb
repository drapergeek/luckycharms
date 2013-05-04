class AddApiKeyToUnit < ActiveRecord::Migration
  def change
    add_column :units, :api_key, :string
  end
end
