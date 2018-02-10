class AddTagType < ActiveRecord::Migration[5.1]
  def up
    add_column :tags, :type, :string, default: "Topic"
    change_column :tags, :type, :string, null: false
  end

  def down
    remove_column :tags, :type
  end
end