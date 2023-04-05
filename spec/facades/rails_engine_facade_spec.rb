require 'rails_helper'

describe RailsEngineFacade do
  it 'creates Merchant poros for all merchants' do
    merchants = RailsEngineFacade.new({}).all_merchants

    expect(merchants.first).to be_a Merchant
  end

  it 'creates Item poros for merchant_items' do
    items = RailsEngineFacade.new({merchant_id: 1}).merchant_items

    expect(items.first).to be_an Item
  end

  it 'creates a single Item poro for an item' do
    item = RailsEngineFacade.new({item_id: 4}).item

    expect(item).to be_an Item
  end
end