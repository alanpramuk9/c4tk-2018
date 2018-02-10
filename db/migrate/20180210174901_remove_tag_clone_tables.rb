class RemoveTagCloneTables < ActiveRecord::Migration[5.1]
  def up
    drop_table :characters
    drop_table :theological_themes
  end
end