class AddTimeLimitRefToServices < ActiveRecord::Migration[6.0]
  def change
    add_reference :services, :time_limit, foreign_key: true
  end
end
