class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.belongs_to :company
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
