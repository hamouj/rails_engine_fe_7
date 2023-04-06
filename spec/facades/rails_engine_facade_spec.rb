require 'rails_helper'

describe RailsEngineFacade do
  describe '#all_merchants' do
    it 'creates Merchant poros for all merchants' do
      VCR.use_cassette('all_merchants', serialize_with: :json) do
        merchants = RailsEngineFacade.new({}).all_merchants

        expect(merchants.first).to be_a Merchant
      end
    end
  end

  describe '#merchant_items' do
    it 'creates Item poros for merchant_items' do
      VCR.use_cassette('merchant_items', serialize_with: :json) do
        items = RailsEngineFacade.new({merchant_id: 1}).merchant_items

        expect(items.first).to be_an Item
      end
    end
  end

  describe '#all_items' do
    it 'creates Item poros for all items' do
      VCR.use_cassette('all_items', serialize_with: :json) do
        items = RailsEngineFacade.new({}).all_items
        
        expect(items.first).to be_an Item
      end
    end
  end

  describe '#item' do
    it 'creates a single Item poro for an item' do
      VCR.use_cassette('get_item', serialize_with: :json) do
        item = RailsEngineFacade.new({item_id: 4}).item

        expect(item).to be_an Item
      end
    end
  end

  describe 'merchant_by_name' do
    it 'returns Merchant poros based on a name match' do
      VCR.use_cassette('all_merchants', serialize_with: :json) do
        merchants = RailsEngineFacade.new({name: 'erde'}).merchant_by_name

        expect(merchants.first).to be_a Merchant
      end
    end
  end
end