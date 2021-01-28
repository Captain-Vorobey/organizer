class AddServiceIdToTimeLimits < ActiveRecord::Migration[6.0]
  def change
    add_column :time_limits, :service_id, :integer
  end
end
