require 'features_helper'

RSpec.describe 'Login User' do
  before do
    UserRepository.new.clear
  end

  it 'successfully logs in a user' do
    visit Web.routes.root_path

    click_link 'Login'

    fill_in 'Email', with: 'asdf'
    fill_in 'Password', with: 'asdf'

    click_button 'Login'

    expect(page).to have_content('Successfully logged in')
  end
end
