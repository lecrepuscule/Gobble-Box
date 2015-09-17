class User < ActiveRecord::Base
  belongs_to :drv_profile
  
  has_many :intakes
  has_many :dishes, through: :intakes
end
