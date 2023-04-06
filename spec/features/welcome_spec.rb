require 'rails_helper'

describe 'Welcome Page' do
  describe 'As a visitor' do
    context 'When I visit the / page' do
      before(:each) do
        visit root_path
      end
      it 'has a search form' do
        visit root_path

        expect(page).to have_field :name
        expect(page).to have_button 'Submit'
      end

      it 'when I type in a partial name, it returns a list of matching merchants' do
        VCR.use_cassette('all_merchants', serialize_with: :json, allow_playback_repeats: true) do
          fill_in :name, with: 'erde'
          click_button 'Submit'

          expect(current_path).to eq(root_path)
          expect(page).to have_link('Schroeder-Jerde')
          expect(page).to have_link('Koch, Wolf and Jerde')
          expect(page).to have_link('Rice, Jerde and White')
        end
      end

      it 'when I type a complete name, it returns the merchant' do
        VCR.use_cassette('all_merchants', serialize_with: :json, allow_playback_repeats: true) do
          fill_in :name, with: 'Schroeder-Jerde'
          click_button 'Submit'

          expect(page).to have_link('Schroeder-Jerde')
        end
      end

      it 'returns case insensitive matches' do
        VCR.use_cassette('all_merchants', serialize_with: :json, allow_playback_repeats: true) do
          fill_in :name, with: 'ERdE'
          click_button 'Submit'

          expect(page).to have_link('Schroeder-Jerde')
          expect(page).to have_link('Koch, Wolf and Jerde')
          expect(page).to have_link('Rice, Jerde and White')
        end
      end

      it 'when there are no matches, it returns a message' do
        VCR.use_cassette('all_merchants', serialize_with: :json, allow_playback_repeats: true) do
          fill_in :name, with: 'Zykl;klj'
          click_button 'Submit'

          expect(page).to have_content('No matches found')
        end
      end

      it 'when I click on a name, I am taken to the merchant show page' do
        VCR.use_cassette('all_merchants', serialize_with: :json, allow_playback_repeats: true) do
          fill_in :name, with: 'erde'
          click_button 'Submit'

          merchants = RailsEngineFacade.new({name: 'erde'}).merchant_by_name
          @merchant1 = merchants.first
        end

        VCR.use_cassette('schroeder_jerde', serialize_with: :json) do
          click_link 'Schroeder-Jerde'

          expect(current_path).to eq(merchant_path(@merchant1.id))
        end
      end
    end
  end
end