require 'rails_helper'

describe RailsEngineService do
  context 'instance methods' do
    context '#all_merchants' do
      it 'returns all merchants data' do
        VCR.use_cassette('all_merchants', serialize_with: :json) do
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
    end

    context '#merchant_items()' do
      it 'returns all items for a specific merchant' do
        VCR.use_cassette('merchant_items', serialize_with: :json) do
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

    context 'all_items' do
      it 'returns all items' do
        VCR.use_cassette('all_items', serialize_with: :json) do
          all_items = RailsEngineService.new.all_items

          expect(all_items).to be_a Hash
          expect(all_items[:data]).to be_an Array

          item = all_items[:data].first

          expect(item).to have_key :id
          expect(item[:id]).to be_a String
          
          expect(item[:attributes]).to have_key :name
          expect(item[:attributes][:name]).to be_a String
        end
      end
    end

    context 'get_item()' do
      it 'returns information for a specific item' do
        VCR.use_cassette('get_item', serialize_with: :json) do
          item = RailsEngineService.new.get_item(4)

          expect(item).to be_a Hash

          expect(item[:data][:attributes]).to have_key :name
          expect(item[:data][:attributes][:name]).to be_a String

          expect(item[:data][:attributes]).to have_key :description
          expect(item[:data][:attributes][:description]).to be_a String

          expect(item[:data][:attributes]).to have_key :unit_price
          expect(item[:data][:attributes][:unit_price]).to be_a Float || Integer
        end
      end
    end
  end
end