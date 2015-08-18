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

  context 'submitting numbers on the homepage' do
    scenario 'user submits 1, then the page shows "one"' do
      visit '/numbers'
      digit = 1
      fill_in 'Number', with: digit
      click_button 'submit number'
      expect(current_path).to eq '/numbers/' + digit.to_s
      expect(page).to have_content('one')
    end
     scenario 'user submits a negative number and get an error message' do
      submit_number(-1)
      expect(page).to have_content('please submit a positive number')
    end
  end

  context 'submitting numbers from 1 to 9' do
    scenario 'user submits 9 and the page shows "nine"' do
      submit_number(9)
      expect(current_path).to eq '/numbers/9'
      expect(page).to have_content('nine')
    end

    scenario 'user submits 1 and the page shows "one"' do
      submit_number(1)
      expect(current_path).to eq '/numbers/1'
      expect(page).to have_content('Your number is one')
    end
  end


  context 'submitting numbers from 10 to 19' do
    scenario 'user submits 19 and the page shows "nineteen"' do
      submit_number(19)
      expect(page).to have_content('nineteen')
    end

    scenario 'user submits 10 and the page shows "ten"' do
      submit_number(10)
      expect(page).to have_content('ten')
    end
  end

  context 'submitting numbers from 20 to 100' do
    scenario 'user submits 55 and the page shows "fifty-five"' do
      submit_number(55)
      expect(page).to have_content('Your number is fifty-five')
    end
    scenario 'users submits tens(30)' do
      submit_number(30)
      expect(page).to have_content('Your number is thirty')
    end
    scenario 'users submits tens(90)' do
      submit_number(90)
      expect(page).to have_content('Your number is ninety')
    end
  end


  context 'submitting numbers from 100 to 999' do
    scenario 'user submits 110 and page shows "one hundred ten"' do
      submit_number(110)
      expect(page).to have_content('Your number is one hundred ten')
    end
    scenario 'user submits 400 and page shows "four hundred"' do
      submit_number(400)
      expect(page).to have_content('Your number is four hundred')
    end
    scenario 'user submits 955 and page shows "nine hundred fifty-five"' do
      submit_number(955)
      expect(page).to have_content('Your number is nine hundred fifty-five')
    end
  end

  context 'submitting numbers from 1000 to 9999' do
    scenario 'user submits 1110 and page shows "one thousand one hundred"' do
      submit_number(1001)
      expect(page).to have_content('Your number is one thousand one')
    end
    scenario 'user submits 9534 and the page shows "nine thousand five hundred thirty-four" ' do
      submit_number(9534)
      expect(page).to have_content('Your number is nine thousand five hundred thirty-four')
    end
  end
end
