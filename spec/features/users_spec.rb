require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    scenario 'should be successful' do
      visit new_user_registration_path
      within('form') do
        fill_in 'First name', with: 'John'
        fill_in 'Last name', with: 'Doe'
        fill_in 'Address', with: 'We Work Ipanema'
        find(:css, ".radio_buttons[value='1']").set(true)
        find(:css, "#user_password").set('123456')
        find(:css, "#user_password_confirmation").set('123456')
        fill_in 'Email', with: 'john@doe.com'
      end
      click_button 'Sign up'

      expect(page).to have_content('Profile')
    end
  end
end
