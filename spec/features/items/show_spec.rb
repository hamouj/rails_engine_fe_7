require 'rails_helper'

describe 'Item Show Page' do
  describe 'As a visitor' do
    context 'When I visit /items/:item_id' do
      before(:each) do
        VCR.use_cassette('get_item', serialize_with: :json, allow_playback_repeats: true) do
          @item = RailsEngineFacade.new({item_id: 4}).item

          visit item_path(@item.id)
        end
      end

      it 'displays the item name, description, and unit price' do
        expect(page).to have_content(@item.name)
        expect(page).to have_content(@item.description)
        expect(page).to have_content("Price per Unit: $#{@item.unit_price}")
      end
    end
  end
end