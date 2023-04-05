require 'rails_helper'

describe Item do
  describe '#initialize' do
    it 'has attributes' do
      item_data = RailsEngineService.new.merchant_items(1)[:data].first
      item = Item.new(item_data)

      expect(item).to be_an Item
      expect(item.id).to eq("4")
      expect(item.name).to eq("Item Nemo Facere")
    end
  end
end