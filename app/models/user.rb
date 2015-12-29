class User < ActiveRecord::Base
  has_secure_password
    
  validates_uniqueness_of :email
  validates :password, :length => {minimum: 8, message: "must be at least 8 characters."}
  
  def minimum_password_length()
    length = 8
  end
  
end
