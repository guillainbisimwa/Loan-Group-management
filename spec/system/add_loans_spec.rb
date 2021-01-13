require 'rails_helper'

RSpec.describe "Create a loan", type: :system do
  before :each do
    User.create(name: 'Guy')
  end

  it 'Logs me in' do
    visit '/'
    click_link 'LOG IN'

    expect(page).to have_content 'LOGIN'

    element = find(:css, "input[id$='session_name']")
    element.fill_in with: 'Guy'

    click_button 'Log in'

    expect(page).to have_content 'WELCOME TO OUR APPLICATION'

    visit '/new_loan'

    expect(page).to have_content 'NEW LOAN'

    element = find(:css, "input[id$='loan_name']")
    element.fill_in with: 'Barcelona'

    element = find(:css, "input[id$='loan_amount']")
    element.fill_in with: 100

    click_button 'Next'

    expect(page).to have_content 'YOU HAVE SUCCESSFULLY CREATED LOAN'

  end
end
