class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :company
      t.string :city
      t.string :street
      t.integer :houseNumber

      t.timestamps
    end
  end
end
