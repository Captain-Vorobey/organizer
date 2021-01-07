class CreateTimeLimits < ActiveRecord::Migration[6.0]
  def change
    create_table :time_limits do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
    end
  end
end
