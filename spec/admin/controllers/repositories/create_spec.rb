RSpec.describe Admin::Controllers::Repositories::Create, type: :action do
  let(:action) { described_class.new }
  let(:repository) { RepositoryRepository.new }

  before do
    repository.clear
  end

  context 'for successful requests' do
    let(:params) { Hash[repository: { source: 'git@github.com:joshmfrankel/sample-cadis-project.git' }] }

    it 'creates a new repository' do
      action.call(params)
      new_repo = repository.last

      expect(new_repo.id).not_to be_nil
    end

    it 'redirects to the repository show page' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq("/admin/repositories/#{repository.last.id}")
    end
  end

  context 'for invalid requests' do
    it 'responds with 422 when source is empty' do
      params = Hash[repository: { source: nil }]
      response = action.call(params)

      expect(response[0]).to eq(422)
    end

    it 'responds with 422 when source is outside pattern' do
      params = Hash[repository: { source: 'git@invalidhub.com:doof/doofergit' }]
      response = action.call(params)

      expect(response[0]).to eq(422)
    end
  end
end
