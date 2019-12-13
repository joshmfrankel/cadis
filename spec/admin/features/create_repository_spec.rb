require 'features_helper'

RSpec.describe 'Create repository' do
  it 'should display repository form' do
    visit Admin.routes.new_repository_path

    expect(page).to have_content('Add new repository')

    within '#repository-form' do
      fill_in 'Source', with: 'git@github.com:joshmfrankel/sample-cadis-project.git'

      click_button 'Submit'
    end

    expect(page).to have_current_path('/admin/repositories')
    expect(page).to have_content('git@github.com:joshmfrankel/sample-cadis-project.git')
  end
end
