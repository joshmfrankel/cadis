require 'features_helper'

RSpec.describe 'Create new Account' do
  it 'should display form' do
    visit Admin.routes.new_account_path

    within '#account-form' do
      fill_in 'Account Name', with: 'My First Account'
      fill_in 'Email', with: 'test@test.com'

      click_button 'Submit'
    end

    expect(page).to have_content('Check your email to verify your new account')
  end

  it 'should display error messages' do
    visit Admin.routes.new_account_path

    click_button 'Submit'

    expect(page).to have_content('Name must be filled')
  end
end
