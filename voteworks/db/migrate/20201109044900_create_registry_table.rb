class CreateRegistryTable < ActiveRecord::Migration
  def change
    create_table :registry do |t|
      t.string :user_name
      t.string :email 
      t.string :password 
    end 
  end
end
