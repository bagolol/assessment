module Digit

  def submit_number(digit)
    visit('/numbers')
    fill_in 'Number', with: digit
    click_button 'submit number'
  end
end