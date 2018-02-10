class CreateAnnotations < ActiveRecord::Migration[5.1]
  def change
    create_table :annotations do |t|
      t.string :type, index: true
      t.references :user

      t.string :title
      t.text :description
      t.boolean :private

      t.boolean :censored
      t.string :review_status

      t.text :quote
      t.text :url
      t.string :source
      t.string :author
      t.string :location

      t.timestamps
    end
  end
end
