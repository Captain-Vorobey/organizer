class AddUserRefToServices < ActiveRecord::Migration[6.0]
  def change
    add_reference :services, :user, foreign_key: true
  end
end
