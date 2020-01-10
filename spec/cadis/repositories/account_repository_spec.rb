RSpec.describe AccountRepository, type: :repository do
  it 'raises NotNullConstraintViolationError without name' do
    account_repo = AccountRepository.new

    expect do
      account_repo.create(name: nil)
    end.to raise_error Hanami::Model::NotNullConstraintViolationError
  end
end
