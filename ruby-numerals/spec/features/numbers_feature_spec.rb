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
    scenario 'user submits 1, then the page shows "one"' do
      visit '/numbers'
      digit = 1
      fill_in 'Number', with: digit
      click_button 'submit number'
      expect(current_path).to eq '/numbers/'+ digit.to_s
      expect(page).to have_content('one')
    end

     scenario 'user submits a number from 1 to 9, then the page shows it spelled out' do
      submit_number(9)
      expect(current_path).to eq '/numbers/9'
      expect(page).to have_content('nine')
    end

    scenario 'user submits a negative number and get an error message' do
      submit_number(-1)
      expect(page).to have_content('please submit a positive number')
    end

    scenario 'user submits a number from 11 to 19' do
      submit_number(19)
      expect(page).to have_content('nineteen')
    end

    scenario 'user submits a number from 20 to 99' do
      submit_number(55)
      expect(page).to have_content('fifty-five')
    end

    scenario 'users submits tens(30)' do
      submit_number(30)
      expect(page).to have_content('Your number is "thirty"')
    end
    scenario 'users submits tens(90)' do
      submit_number(90)
      expect(page).to have_content('Your number is "ninety"')
    end
    scenario 'users submits tens(10)' do
      submit_number(10)
      expect(page).to have_content('Your number is "ten"')
    end
    scenario 'user submits hundreds (110)' do
      submit_number(110)
      expect(page).to have_content('Your number is "one-hundred-ten"')
    end
    scenario 'user submits hundreds (400)' do
      submit_number(400)
      expect(page).to have_content('Your number is "four-hundred"')
    end
    scenario 'user submits hundreds (155)' do
      submit_number(155)
      expect(page).to have_content('Your number is "one-hundred-fifty-five"')
    end
    scenario 'user submits thousands (1110)' do
      submit_number(1110)
      expect(page).to have_content('Your number is "one-thousand-one-hundred-ten"')
    end
    scenario 'user submits thousands (1001)' do
      submit_number(1001)
      expect(page).to have_content('Your number is "one-thousand-one"')
    end
  end
end