class User < ActiveRecord::Base
  validates :name,  presence: true, length: { maximum: 50 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #this REGEX can allow double dot asd@adf..com
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i #this only allows single do
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },  uniqueness: { case_sensitive: true }
  
  #before_save { self.email = email.downcase }
  before_save { email.downcase! } #ruby way of save and apply to itself
  has_secure_password 
  validates :password, length: { minimum: 6 }
end