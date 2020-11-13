class User < ActiveRecord::Base
    has_secure_password 

    validates :email, :presence => true
    
    has_many :registries # (when user votes for a different election, to create new registry ) 
  end