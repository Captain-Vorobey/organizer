class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.integer :houseNumber
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end