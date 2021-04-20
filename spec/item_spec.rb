require './lib/item'

RSpec.describe Item do

  describe 'initialize' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: "$2.50"})

    it 'exists and has accessible attributes' do
      expect(item1).to be_instance_of(Item)
      expect(item1.name).to eq('Peach Pie (Slice)')
      expect(item1.price).to eq('$3.75')
    end
  end
end
