class CreateTransfers < ActiveRecord::Migration[6.0]
  def change
    create_table :transfers do |t|
      t.references :source_account, foreign_key: { to_table: :accounts }
      t.references :target_account, foreign_key: { to_table: :accounts }
      t.float :value
      t.timestamps
    end
  end
end
