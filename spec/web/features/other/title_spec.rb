require 'features_helper'

RSpec.describe 'Title' do
  it 'should display a formatted page title' do
    visit routes.new_project_path

    expect(page).to have_title('New Repository | Admin')
  end
end
