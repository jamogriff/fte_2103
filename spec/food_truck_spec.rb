require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do

  describe 'initialization and stocking' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: "$2.50"})
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    it 'exists and accesses its attributes' do
      expect(food_truck).to be_instance_of(FoodTruck)
      expect(food_truck.name).to eq('Rocky Mountain Pies')
      expect(food_truck.inventory).to be_instance_of(Hash)
    end

    it 'can stock inventory' do
      food_truck.stock(item1, 25)
      food_truck.stock(item2, 12)
      expect(food_truck.inventory[item1]).to eq(25)
    end

    it 'can check stock' do
      expect(food_truck.check_stock(item1)).to eq(25)
    end

  end
end
