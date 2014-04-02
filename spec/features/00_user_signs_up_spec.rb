require 'spec_helper'

feature "User signs up", %Q{
  As a User
  I want to sign up
  so that I can be authenticated and use the site
} do

  # Acceptance Criteria:
  # * I must specify a valid email address
  # * I must specify and confirm a password
  # * If I fail either of the above, I receive an error message
  # * If I specify valid info, my account is registered and I am authenticated

  scenario 'specifying valid and required info' do
    visit new_user_registration_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content("success")
  end

  scenario 'specifying incomplete info' do
    visit new_user_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'password not confirmed' do
    visit new_user_registration_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'idiot'

    click_button 'Sign up'
    expect(page).to have_content("doesn't match")
  end

end
