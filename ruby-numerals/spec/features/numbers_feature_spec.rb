require 'rails_helper'

feature 'numbers' do
  context 'the index page shows a form' do
    scenario 'should display a prompt to submit a number' do
      visit '/numbers'
      expect(page).to have_button 'submit number'
    end
  end

  context 'submitting numbers' do
    scenario 'the user submits a number, then the page shows the word for it' do
      visit '/numbers'
      number = 1
      fill_in 'Number', with: number
      click_button 'submit number'

      expect(current_path).to eq '/numbers/'+ number.to_s
      expect(page).to have_content('')
    end
  end
end