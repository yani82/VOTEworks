class CreateRegistryTable < ActiveRecord::Migration
  def change
    create_table :registry do |t|
      t.string :user_id
      t.string :first_name
      t.string :last_name 
      t.string :address
      t.string :address_line_2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :country
    end 
  end
end
