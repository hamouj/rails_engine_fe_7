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
        fill_in :name, with: 'erde'
        click_button 'Submit'

        expect(current_path).to eq(root_path)
        expect(page).to have_link('Schroeder-Jerde')
        expect(page).to have_link('Koch, Wolf and Jerde')
        expect(page).to have_link('Rice, Jerde and White')
      end

      it 'when I type a complete name, it returns the merchant' do
        fill_in :name, with: 'Schroeder-Jerde'
        click_button 'Submit'

        expect(page).to have_link('Schroeder-Jerde')
      end

      it 'when there are no matches, it returns a message' do
        fill_in :name, with: 'Zykl;klj'
        click_button 'Submit'

        expect(page).to have_content('No matches found')
      end

      it 'when I click on a name, I am taken to the merchant show page' do
        fill_in :name, with: 'erde'
        click_button 'Submit'

        merchants = RailsEngineFacade.new({name: 'erde'}).merchant_by_name
        merchant1 = merchants.first

        click_link 'Schroeder-Jerde'

        expect(current_path).to eq(merchant_path(merchant1.id))
      end
    end
  end
end