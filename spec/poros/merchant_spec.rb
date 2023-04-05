require 'rails_helper'

describe Merchant do
  describe '#initialize' do
    it 'has attributes' do
      merchant_data = RailsEngineService.new.all_merchants[:data].first
      merchant = Merchant.new(merchant_data)

      expect(merchant).to be_a Merchant
      expect(merchant.id).to eq('1')
      expect(merchant.name).to eq('Schroeder-Jerde')
    end
  end
end