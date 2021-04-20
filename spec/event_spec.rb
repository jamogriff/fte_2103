require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do

  describe 'initialization' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: "$2.50"})
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    food_truck.stock(item1, 25)
    food_truck.stock(item2, 12)
    event = Event.new("South Pearl Street Farmers Market")

    it 'exists and accesses it attributes' do
      expect(event.name).to eq("South Pearl Street Farmers Market")
      expect(event.food_trucks).to be_instance_of(Array)
    end

  end

end
