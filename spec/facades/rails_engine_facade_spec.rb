require 'rails_helper'

describe RailsEngineFacade do
  it 'creates Merchant poros for all merchants' do
    merchant = RailsEngineFacade.new({}).all_merchants

    expect(merchant.first).to be_a Merchant
  end
end