class Gallery < ActiveRecord::Base
  has_many :pictures
  belongs_to :foody
end
