require 'spec_helper'

feature "User edits profile", %Q{
  As a User
  I want to set up my profile
  so that other users can check it out
} do

  # Acceptance Criteria:
  # *

  scenario 'specifying valid and required info' do
    user = FactoryGirl.create(:user)
    login(user)
    visit root_path
    click_on 'My Profile'
    fill_in 'Preferred fighting', with: 'rubber chicken'
    fill_in 'Preferred roles', with: 'your mother'
    fill_in 'Other', with: 'also your mother'
    click_on 'Save'

    expect(page).to have_content('successfully')
    expect(page).to have_content('also your mother')
  end

end
