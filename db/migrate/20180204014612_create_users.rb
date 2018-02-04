class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :email, null: false, index: true
      t.string :password_digest, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
