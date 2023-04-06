require 'rails_helper'

describe 'Item Index Page' do
  describe 'As a visitor' do
    context 'When I visit /items' do
      before(:each) do
        VCR.use_cassette('all_items', serialize_with: :json, allow_playback_repeats: true) do
          items = RailsEngineFacade.new({}).all_items

          @item1 = items.first
          @item2 = items.last

          visit items_path
        end
      end

      it 'lists all items' do
        within "div#item-#{@item1.id}" do
          expect(page).to have_link(@item1.name)
        end

        within "div#item-#{@item2.id}" do
          expect(page).to have_link(@item2.name)
        end
      end
    end
  end
end