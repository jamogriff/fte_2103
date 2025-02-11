require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do

  describe 'initialization' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: "$2.50"})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item3, 25)
    food_truck2.stock(item4, 50)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event = Event.new("South Pearl Street Farmers Market")

    it 'exists and accesses it attributes' do
      expect(event.name).to eq("South Pearl Street Farmers Market")
      expect(event.food_trucks).to be_instance_of(Array)
    end

    it 'can add food trucks and return names' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expect(event.food_trucks.length).to eq(3)
      expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it 'can return list of food trucks from item name' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      name = "Banana Nice Cream"
      expect(event.food_trucks_that_sell(name)).to eq([food_truck2])
    end

    it 'can return sorted item list' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expected = ['Apple Pie (Slice)', "Banana Nice Cream", 'Peach Pie (Slice)', "Peach-Raspberry Nice Cream"]
      expect(event.sorted_item_list).to eq(expected)
    end

    it 'can report total inventory' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expect(event.total_inventory[item4][:quantity]).to eq(50)
      expect(event.total_inventory[item4][:food_trucks].length).to eq(1)
    end

    it 'can add all quantity of item' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expect(event.get_quantity_from('Peach Pie (Slice)')).to eq(100)
    end

    it 'checks for overstocked items' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expect(event.overstocked_items).to eq([item1])
    end

  end

end
