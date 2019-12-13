require 'features_helper'

RSpec.describe 'Visit home page' do
  it 'is successful' do
    visit '/'

    expect(page).to have_content('Welcome to Cadis')
  end

  it 'has a navigation menu' do
    visit '/'

    expect(page).to have_link('Resources', href: Web.routes.resources_path)
    expect(page).to have_link('Add Repository', href: Admin.routes.new_repository_path)
  end
end
