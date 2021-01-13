require 'rails_helper'

RSpec.describe 'Login and sign up', type: :system do
  before :each do
    User.create(name: 'Guy')
  end

  it 'Logs me in' do
    visit '/'
    click_link 'LOG IN'
    sleep(3)

    expect(page).to have_content 'LOGIN'

    element = find(:css, "input[id$='session_name']")
    element.fill_in with: 'Guy'

    click_button 'Log in'

    expect(page).to have_content 'WELCOME TO OUR APPLICATION'
    
    sleep(3)

  end

  it 'Signs up User' do
    visit '/'
    click_link 'SIGN UP'
    sleep(3)

    expect(page).to have_content 'REGISTER'

    element = find(:css, "input[id$='session_name']")
    element.fill_in with: 'Eva'

    click_button 'Next'

    expect(page).to have_content 'YOU ARE SUCCESSFULLY REGISTERED'
    sleep(3)

  end

  it 'Fails to access home page with an unlogged in user' do
    visit '/home'
    expect(page).to have_content 'YOU MUST BE LOGGED IN!'
    sleep(3)

  end
end
