require 'rails_helper'

describe 'Merchant Show Page' do
  describe 'As a visitor' do
    context 'When I visit /merchants/:id' do
      before(:each) do
        merchants = RailsEngineFacade.new({}).all_merchants
        @merchant1 = merchants.first

        items = RailsEngineFacade.new({id: 1}).merchant_items
        @item1 = items.first
        @item2 = items.last
      end
      it 'I get to the page from the merchant index page' do
        visit merchants_path

        click_link @merchant1.name

        expect(current_path).to eq(merchant_path(@merchant1.id))
      end

      it 'I see a list of items that merchant sells' do
        visit merchant_path(@merchant1.id)

        within "div#item-#{@item1.id}" do
          expect(page).to have_link(@item1.name)
        end

        within "div#item-#{@item2.id}" do
          expect(page).to have_link(@item2.name)
        end
      end

      it 'When I click on an item name, I am taken to the item show page' do
        visit merchant_path(@merchant1.id)

        click_link @item1.name

        expect(current_path).to eq(item_path(@item1.id))
      end
    end
  end
end