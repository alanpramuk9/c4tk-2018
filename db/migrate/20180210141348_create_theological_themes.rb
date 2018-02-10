class CreateTheologicalThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :theological_themes do |t|
      t.string :canonical_name
      t.string :variant

      t.timestamps
    end
  end
end
