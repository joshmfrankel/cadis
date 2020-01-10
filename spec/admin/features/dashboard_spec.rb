require "features_helper"

RSpec.describe 'Admin dashboard and configuration' do
  it 'should display title' do
    visit Admin.routes.root_path

    expect(page).to have_content(I18n.t('admin.dashboard.title'))
  end

  it 'show add project button without created project' do
    visit Admin.routes.root_path

    expect(page).to have_link('Setup new Project', href: Admin.routes.new_project_path)
  end
end
