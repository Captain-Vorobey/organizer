class RemoveCardBrandFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :stripe_id, :string
    remove_column :users, :card_brand, :string
    remove_column :users, :card_exp_month, :string
    remove_column :users, :card_exp_year, :string
    remove_column :users, :card_last4, :string
  end
end
