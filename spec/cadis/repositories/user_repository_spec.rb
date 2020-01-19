RSpec.describe UserRepository, type: :repository do
  describe '#find_with_account' do
    it 'belongs to an account' do
      account = AccountRepository.new.create(name: 'Academy of magic')
      user = UserRepository.new
      new_user = user.create(name: 'Yennifer', email: 'yennifer@vengerberg.com', account_id: account.id)

      expect(user.find_with_account(new_user.id).account).to eq(account)
    end
  end
end
