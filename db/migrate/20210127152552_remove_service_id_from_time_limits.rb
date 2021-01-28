class RemoveServiceIdFromTimeLimits < ActiveRecord::Migration[6.0]
  def change
    remove_column :time_limits, :service_id, :integer
  end
end
