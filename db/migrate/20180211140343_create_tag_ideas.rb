class CreateTagIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_ideas do |t|
      t.references :idea_board, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
