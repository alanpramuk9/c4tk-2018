class RenameAnnotationToCard < ActiveRecord::Migration[5.1]
  def change
    rename_table :annotations, :cards
  end
end
