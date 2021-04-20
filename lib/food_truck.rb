class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(item, quantity)
    @inventory[item] = quantity
  end



end
