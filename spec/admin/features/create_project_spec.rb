require 'features_helper'

RSpec.describe 'Create project' do
  it 'should display error messages' do
    visit Admin.routes.new_project_path

    click_button 'Submit'

    expect(page).to have_content("Source must be filled")
  end

  it 'should display project form' do
    visit Admin.routes.new_project_path

    expect(page).to have_content('Add new project')

    within '#project-form' do
      fill_in 'Source', with: 'git@github.com:joshmfrankel/sample-cadis-project.git'

      click_button 'Submit'
    end

    expect(page).to have_content('git@github.com:joshmfrankel/sample-cadis-project.git')
  end
end
