class Foody < ActiveRecord::Base
  has_many :galleries
  has_many :pictures, through: :galleries

  has_secure_password
end
