class CreateTransfers < ActiveRecord::Migration[6.0]
  def change
    create_table :transfers do |t|
      t.references :source_account, index: true, foreign_key: { to_table: :bank_accounts }
      t.references :target_account, index: true, foreign_key: { to_table: :bank_accounts }
      t.float :value
      t.timestamps
    end
  end
end
