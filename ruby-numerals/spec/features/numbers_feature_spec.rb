require 'rails_helper'
require_relative '../helpers/numbers_helpers'
include Digit


feature 'numbers' do
  context 'the index page shows a form' do
    scenario 'should display a prompt to submit a number' do
      visit '/numbers'
      expect(page).to have_button 'submit number'
    end
  end

  context 'submitting numbers' do
    scenario 'the user submits 1, then the page shows "one"' do
      visit '/numbers'
      digit = 1
      fill_in 'Number', with: digit
      click_button 'submit number'
      expect(current_path).to eq '/numbers/'+ digit.to_s
      expect(page).to have_content('one')
    end

     scenario 'the user submits a number from 1 to 9, then the page shows it spelled out' do
      submit_number(9)
      expect(current_path).to eq '/numbers/9'
      expect(page).to have_content('nine')
    end
  end
end