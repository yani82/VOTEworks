class CreateRegistriesTable < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name 
      t.string :address
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
    end 
  end
end
