require 'rails_helper'

RSpec.describe 'Login and sign up', type: :system do
  before :each do
    User.create(name: 'Guy')
  end

  it 'Logs me in' do
    visit '/'
    click_link 'LOG IN'
    sleep(5)

    expect(page).to have_content 'LOGIN'

    element = find(:css, "input[id$='session_name']")
    element.fill_in with: 'Guy'

    click_button 'LOGIN'
    sleep(5)

    expect(page).to have_content 'WELCOME TO OUR APPLICATION'
  end
end
