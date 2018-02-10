class RenameTopicToTag < ActiveRecord::Migration[5.1]
  def change
    rename_table :topics, :tags
  end
end
