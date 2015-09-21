class User < ActiveRecord::Base
  belongs_to :drv_profile
  
  has_many :intakes
  has_many :dishes, through: :intakes

  def add_intake(dish, serving, date)
    intakes.create(dish: dish, serving: serving, date: date)
  end

end
