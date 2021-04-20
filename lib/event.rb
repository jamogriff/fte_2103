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

  def get_quantity_from(item_name)
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        # require 'pry'; binding.pry
        if item[0].name == item_name
          return item[1]
        else
          0
        end
      end
    end
  end

  def sorted_item_list
    the_list = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        if item[1] > 0
          the_list << item[0].name
        end
      end
    end
    the_list.uniq.sort
  end

  def total_inventory
    total_inventory = {}
    sorted_item_list.each do |item_name|
      total_inventory[get_item_from(item_name)[0]] = {
        quantity: get_quantity_from(item_name),
        food_trucks: food_trucks_that_sell(item_name)
      }
    end
    total_inventory
  end
end
