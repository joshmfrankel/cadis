require 'features_helper'

RSpec.describe 'Visit home page' do
  it 'is successful' do
    visit '/'

    expect(page).to have_content('Welcome to Cadis')
  end
end
