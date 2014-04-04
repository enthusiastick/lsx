require 'spec_helper'

feature "User signs in", %Q{
  As a User
  I want to sign in
  so that I can be authenticated and use the site
} do

  # Acceptance Criteria:
  # * If I specify a valid, previously registered email and password, I am authenticated
  # * If I specify an invalid email or password, I remain unauthenticated
  # * If I am already signed in, I can't sign in again

  scenario 'existing user specifies valid info' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'
    expect(page).to have_content('successfully.')
  end

  scenario 'an unregistered user signs in' do
    visit new_user_session_path
    fill_in 'Email', with: 'whoever@example.com'
    fill_in 'Password', with: '1234'

    click_button 'Sign in'
    expect(page).to_not have_content('Welcome')
    expect(page).to have_content('Invalid')
  end

  scenario 'existing user with wrong password' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrong'

    click_button 'Sign in'
    expect(page).to_not have_content('Welcome')
    expect(page).to have_content('Invalid')
  end

end
