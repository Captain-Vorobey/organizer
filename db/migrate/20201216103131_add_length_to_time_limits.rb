class AddLengthToTimeLimits < ActiveRecord::Migration[6.0]
  def change
    add_column :time_limits, :length, :integer
  end
end
