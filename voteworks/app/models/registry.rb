class Registry < ActiveRecord::Base
    belongs_to :user 
    validates :first_name, :last_name, :address, :city, :state, :zipcode, :country, presence: true
  end