require 'features_helper'

RSpec.describe 'Register a new user' do
  before do
    UserRepository.new.clear
  end

  it 'displays the registration form' do
    visit Web.routes.register_path

    within '#user-form' do
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '1234'
    end

    click_button 'Register'

    expect(page).to have_content(
      'Check your email to confirm your email address'
    )
  end
end
