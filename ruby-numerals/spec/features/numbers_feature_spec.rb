require 'rails_helper'

feature 'numbers' do
  context 'the index page shows a form' do
    scenario 'should display a prompt to submit a number' do
      visit '/numbers'
      expect(page).to have_link 'submit number'
    end
  end

  context 'submitting numbers' do
    scenario 'the user submits a number, then the page shows the word for it' do
      visit '/numbers'
      fill_in 'Number', with: 1
      click_button 'submit number'
      expect(page).to have_content 'one'
    end
  end
end