require 'rails_helper'

describe 'user authentication' do

  scenario 'valid users can login' do

    visit '/'
      click_on 'New User'
        fill_in 'user[user_name]', with: 'joecamel'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_on 'Create User'
      # expect(page).to have_content ('new user created')

      click_on 'Log In'
        fill_in 'user_name', with: 'joecamel'
        fill_in 'password', with: 'password'
        click_on 'Sign In'

        expect(page).to have_content('Log Out')
  end

  scenario 'invalid users cannot login' do

    visit '/'
      click_on 'Log In'
      fill_in 'user_name', with: 'unregistered'
      fill_in 'password', with: 'fake'
      click_on 'Sign In'

      expect(page).to have_content('Username / password combination is invalid')

  end

  

end
