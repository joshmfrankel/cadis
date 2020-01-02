RSpec.describe Admin::Controllers::Projects::Create, type: :action do
  let(:action) { described_class.new }
  let(:project) { ProjectRepository.new }

  before do
    project.clear
  end

  context 'for successful requests' do
    let(:params) { Hash[project: { source: 'git@github.com:joshmfrankel/sample-cadis-project.git' }] }

    it 'creates a new project' do
      action.call(params)
      new_repo = project.last

      expect(new_repo.id).not_to be_nil
    end

    it 'redirects to the project show page' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq("/admin/projects/#{project.last.id}")
    end
  end

  context 'for invalid requests' do
    it 'responds with 422 when source is empty' do
      params = Hash[project: { source: nil }]
      response = action.call(params)

      expect(response[0]).to eq(422)
    end

    it 'responds with 422 when source is outside pattern' do
      params = Hash[project: { source: 'git@invalidhub.com:doof/doofergit' }]
      response = action.call(params)

      expect(response[0]).to eq(422)
    end
  end
end
