require 'rails_helper'

describe 'Merchant Index Page' do
  describe 'As a visitor' do
    context 'When I visit /merchants' do
      before(:each) do
        merchants = RailsEngineFacade.new({}).all_merchants
        @merchant1 = merchants.first
        @merchant2 = merchants.last

        visit merchants_path
      end

      it 'I see a list of merchants by name' do
        within "div#merchant-#{@merchant1.id}" do
          expect(page).to have_link(@merchant1.name)
        end

        within "div#merchant-#{@merchant2.id}" do
          expect(page).to have_link(@merchant2.name)
        end
      end

      it "When I click the merchant's name, I am redirect to the merchant's show page" do
        click_link @merchant1.name

        expect(current_path).to eq(merchant_path(@merchant1.id))
      end
    end
  end
end