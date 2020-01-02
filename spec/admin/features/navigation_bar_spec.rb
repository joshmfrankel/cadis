require 'features_helper'

RSpec.describe 'Navigation bar' do
  it 'displays links for available pages' do
    visit Admin.routes.root_path

    within 'nav' do
      expect(page).to have_link('Back to Cadis', href: Web.routes.root_path)
    end
  end
end
