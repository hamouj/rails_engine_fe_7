require 'rails_helper'

describe RailsEngineService do
  context 'instance methods' do
    context '#all_merchants' do
      it 'returns all merchants data' do
        all_merchants = RailsEngineService.new.all_merchants

        expect(all_merchants).to be_a Hash
        expect(all_merchants[:data]).to be_an Array

        merchant = all_merchants[:data].first

        expect(merchant).to have_key :id
        expect(merchant[:id]).to be_a String
        
        expect(merchant[:attributes]).to have_key :name
        expect(merchant[:attributes][:name]).to be_a String
      end
    end

    context '#merchant_items()' do
      it 'returns all items for a specific merchant' do
        merchant_items = RailsEngineService.new.merchant_items(1)

        expect(merchant_items).to be_a Hash
        expect(merchant_items[:data]).to be_an Array

        item = merchant_items[:data].first

        expect(item).to have_key :id
        expect(item[:id]).to be_a String

        expect(item[:attributes]).to have_key :name
        expect(item[:attributes][:name]).to be_a String
      end
    end
  end
end