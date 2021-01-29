class AddIntervalToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :interval, :string
  end
end
