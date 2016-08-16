require 'bcrypt'

class User < ApplicationRecord
  has_one :profile
  has_many :votes
  
  has_secure_password


end
