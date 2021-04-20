class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map { |truck| truck.name }
  end

  def food_trucks_that_sell(item_name)
    found_trucks = []
    item_object = get_item_from(item_name)[0]
    # require 'pry';binding.pry
    @food_trucks.each do |truck|
      if truck.check_stock(item_object) > 0
        found_trucks << truck
      end
    end
    found_trucks.uniq
  end

  def get_item_from(item_name)
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        # require 'pry'; binding.pry
        if item[0].name == item_name
          return item
        else
          nil
        end
      end
    end
  end

  def sorted_item_list
    the_list = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        the_list << item[0].name
      end
    end
    the_list.uniq.sort
  end

end
