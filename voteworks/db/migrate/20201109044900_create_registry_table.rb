class CreateRegistryTable < ActiveRecord::Migration
  def change
    create_table :registry do |t|
      t.integer :id_number
      t.integer :dob
      t.integer :zipcode
      t.integer :last4ssn 
      t.string :email 
      t.string :password 
    end 
  end
end
