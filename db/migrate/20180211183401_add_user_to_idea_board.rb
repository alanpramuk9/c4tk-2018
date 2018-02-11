class AddUserToIdeaBoard < ActiveRecord::Migration[5.1]
  def up
    add_reference :idea_boards, :user, index: true
    add_foreign_key :idea_boards, :users
  end

  def down
    remove_foreign_key :idea_boards, :users
    remove_reference :idea_boards, :user
  end
end