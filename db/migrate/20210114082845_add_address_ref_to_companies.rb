class AddAddressRefToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_reference :companies, :address, foreign_key: true
  end
end
