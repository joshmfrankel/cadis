RSpec.describe AccountRepository, type: :repository do
  it 'raises NotNullConstraintViolationError without name' do
    account_repo = AccountRepository.new

    expect do
      account_repo.create(name: nil)
    end.to raise_error Hanami::Model::NotNullConstraintViolationError
  end

  describe '#create_with_users' do
    it 'creates an Account with Users' do
      account_repo = AccountRepository.new

      data = {
        name: 'My First Account',
        users: [{ name: 'Geralt of Rivia', email: 'geralt@rivia.continent' }]
      }

      new_account = account_repo.create_with_users(data)

      expect(new_account.users.first).to have_attributes(name: 'Geralt of Rivia', email: 'geralt@rivia.continent')
    end
  end
end
