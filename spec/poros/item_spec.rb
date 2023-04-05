require 'rails_helper'

describe Item do
  describe '#initialize' do
    it 'has attributes' do
      item_data = RailsEngineService.new.merchant_items(1)[:data].first
      item = Item.new(item_data)

      expect(item).to be_an Item
      expect(item.id).to eq("4")
      expect(item.name).to eq("Item Nemo Facere")
      expect(item.description).to eq("Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.")
      expect(item.unit_price).to eq(42.91)
    end
  end
end