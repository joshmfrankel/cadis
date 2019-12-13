RSpec.describe RepositoryRepository, type: :repository do
  it 'raises Not Null constraint error without source' do
    repo = RepositoryRepository.new

    expect do
      repo.create(invalid: 'hi')
    end.to raise_error Hanami::Model::NotNullConstraintViolationError
  end
end
