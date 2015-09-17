class Drv < ActiveRecord::Base
  belongs_to :nutrient
  belongs_to :drv_profile
end
