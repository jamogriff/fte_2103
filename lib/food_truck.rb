class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(item, quantity)
    @inventory[item] = quantity
  end

  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    total = []
    @inventory.sum do |item, quantity|
      (item.price[1..-1].to_f * quantity)
    end
  end



end
