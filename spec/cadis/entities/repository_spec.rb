RSpec.describe Repository, type: :entity do
  it 'can be initialized with attributes' do
    repo = Repository.new(source: 'git@github.com:joshmfrankel/sample-cadis-project.git')
    expect(repo.source).to eq('git@github.com:joshmfrankel/sample-cadis-project.git')
  end
end
