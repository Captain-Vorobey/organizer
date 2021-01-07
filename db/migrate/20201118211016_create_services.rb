class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.string :avatar
      t.references :company, null: false, foreign_key: true
      t.references :time_limit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
