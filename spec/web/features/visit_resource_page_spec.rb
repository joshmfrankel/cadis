require 'features_helper'

RSpec.describe 'Visit resource page' do
  it 'is successful' do
    visit Web.routes.resources_path

    expect(page).to have_content('Resource listing')
  end
end

