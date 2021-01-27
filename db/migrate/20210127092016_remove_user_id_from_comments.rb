class RemoveUserIdFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :user_id, :integer
    remove_column :comments, :service_id, :integer
  end
end
