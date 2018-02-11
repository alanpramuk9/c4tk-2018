class AddSponsoredCards < ActiveRecord::Migration[5.1]
  def up
    add_column :cards, :sponsored, :boolean
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end