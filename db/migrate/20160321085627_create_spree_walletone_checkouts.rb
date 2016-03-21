class CreateSpreeWalletoneCheckouts < ActiveRecord::Migration
  def change
    create_table :spree_walletone_checkouts do |t|
      t.string :token
      t.string :payer_id
      t.string :state, default: 'complete'
      t.string :transaction_id
    end
  end
end
