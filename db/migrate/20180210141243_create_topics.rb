class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :canonical_name
      t.string :variant

      t.timestamps
    end
  end
end
