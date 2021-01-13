require 'rails_helper'

RSpec.describe "Create a group and see Group's details", type: :system do
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

    
    click_link 'All groups'
    
    expect(page).to have_content 'NEW GROUP'

    click_link 'New group'

    expect(page).to have_content 'NEW GROUP'

    element = find(:css, "input[id$='group_name']")
    element.fill_in with: 'Barcelona'

    click_button 'Next'

    expect(page).to have_content 'GROUP WAS SUCCESSFULLY CREATED'

    click_link 'Barcelona'

    expect(page).to have_content 'This loan group is created'
  end
end
