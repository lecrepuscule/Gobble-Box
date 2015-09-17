class DrvProfile < ActiveRecord::Base
  has_many :drvs
  has_many :nutrients, through: :drvs

  has_many :users
end
