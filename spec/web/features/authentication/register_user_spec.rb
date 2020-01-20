require 'features_helper'

RSpec.describe 'Register a new user' do
  it 'displays the registration form' do
    visit Web.routes.root_path

    click_link 'Register'

    within '#user-form' do
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '1234'
    end

    click_button 'Register'

    expect(page).to have_content('Check your email to confirm your email address')
  end
end
