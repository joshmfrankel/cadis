require 'features_helper'

RSpec.describe 'Navigation bar' do
  it 'displays links for available pages' do
    visit Web.routes.root_path

    within 'nav' do
      expect(page).to have_link('Home', href: Web.routes.root_path)
      expect(page).to have_link('Resources', href: Web.routes.resources_path)
    end
  end
end
