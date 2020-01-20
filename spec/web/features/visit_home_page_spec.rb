require 'features_helper'

RSpec.describe 'Visit home page' do
  it 'is successful' do
    visit '/'

    expect(page).to have_content('Welcome to Cadis')
    expect(page).to have_link('Home', href: Web.routes.root_path)
    expect(page).to have_link('Login', href: Web.routes.path(:login))
    expect(page).to have_link('Register', href: Web.routes.path(:register))
  end
end
