class User < ActiveRecord::Base
    has_secure_password

    validates_presence_of :name, :email, :password
    validates :email, uniqueness: true 
    
    has_many :logs
end 