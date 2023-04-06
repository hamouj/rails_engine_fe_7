require 'rails_helper'

describe 'Merchant Show Page' do
  describe 'As a visitor' do
    context 'When I visit /merchants/:merchant_id' do
      before(:each) do
        VCR.use_cassette('all_merchants', serialize_with: :json, allow_playback_repeats: true) do
          merchants = RailsEngineFacade.new({}).all_merchants
          @merchant1 = merchants.first
        end

        VCR.use_cassette('merchant_items', serialize_with: :json, allow_playback_repeats: true) do
          items = RailsEngineFacade.new({merchant_id: 1}).merchant_items
          @item1 = items.first
          @item2 = items.last

          visit merchant_path(@merchant1.id)
        end
      end

      it 'I get to the page from the merchant index page' do
        VCR.use_cassette('all_merchants', serialize_with: :json, allow_playback_repeats: true) do
          visit merchants_path
        end

        VCR.use_cassette('merchant_items', serialize_with: :json, allow_playback_repeats: true) do
          click_link @merchant1.name

          expect(current_path).to eq(merchant_path(@merchant1.id))
        end
      end

      it 'I see a list of items that merchant sells' do
        VCR.use_cassette('merchant_items', serialize_with: :json, allow_playback_repeats: true) do
          visit merchant_path(@merchant1.id)

          within "div#item-#{@item1.id}" do
            expect(page).to have_link(@item1.name)
          end

          within "div#item-#{@item2.id}" do
            expect(page).to have_link(@item2.name)
          end
        end
      end

      it 'When I click on an item name, I am taken to the item show page' do
        VCR.use_cassette('merchant_items', serialize_with: :json, allow_playback_repeats: true) do
          visit merchant_path(@merchant1.id)
        end
        
        VCR.use_cassette('get_item', serialize_with: :json, allow_playback_repeats: true) do
          click_link @item1.name

          expect(current_path).to eq(item_path(@item1.id))
        end
      end
    end
  end
end