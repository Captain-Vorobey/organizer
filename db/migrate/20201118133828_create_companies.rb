class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :avatar
      t.references :service, null: true, foreign_key: true
      t.references :address, null: true, foreign_key: true

      t.timestamps
    end
  end
end
