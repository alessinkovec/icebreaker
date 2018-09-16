require 'rails_helper'

RSpec.feature "Users Chrome", type: :feature do
  context 'create new user' do
    before(:each) do
      visit new_user_registration_path
      within('form') do
        fill_in 'First name', with: 'John'
        fill_in 'Last name', with: 'Doe'
        find(:css, ".radio_buttons[value='1']").set(true)
        find(:css, "#user_password").set('123456')
        find(:css, "#user_password_confirmation").set('123456')
        fill_in 'Email', with: 'john@doe.com'
      end
    end
    scenario 'should be successful' do
      within('form') do
        fill_in 'Address', with: 'We Work Ipanema'
      end
      click_button 'Sign up'

      expect(page).to have_content('Profile')
    end

    scenario 'should fail' do
      click_button 'Sign up'

      expect(page).to have_content('Address can\'t be blank')
    end
  end

  context 'update user' do
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
      visit edit_user_registration_path
    end
    scenario 'should be successful' do
      within('form') do
        fill_in 'Last name', with: 'Silva'
        find(:css, "#user_current_password").set('123456')
      end
      click_button 'Update'

      visit edit_user_registration_path
      expect(page).to have_selector("#user_last_name[value='Silva']")
    end

    scenario 'should fail' do
      within('form') do
        fill_in 'Last name', with: ''
      end
      click_button 'Update'

      expect(page).to have_content('Last name can\'t be blank')
    end
  end
end
