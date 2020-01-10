require 'features_helper'

RSpec.describe 'Create new Account' do
  it 'should display form' do
    visit Admin.routes.new_account_path

    within '#account-form' do
      fill_in 'Name', with: "My First Account"

      click_button 'Submit'
    end

    expect(page).to have_content('Create a User')
  end
end
