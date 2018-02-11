class CreateCardIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :card_ideas do |t|
      t.references :idea_board, foreign_key: true
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
