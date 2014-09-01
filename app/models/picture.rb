class Picture < ActiveRecord::Base
  belongs_to :gallery
  has_one :foody, through: :gallery
end
