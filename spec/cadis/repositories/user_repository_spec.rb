RSpec.describe UserRepository, type: :repository do
  let(:email) { 'yennifer@vengerberg.com' }
  let(:user_repo) { UserRepository.new }

  before do
    user_repo.clear
  end

  describe '#find_with_account' do
    it 'belongs to an account' do
      account = AccountRepository.new.create(name: 'Academy of magic')
      new_user = user_repo.create(name: 'Yennifer', email: 'yennifer@vengerberg.com', account_id: account.id)

      expect(user_repo.find_with_account(new_user.id).account).to eq(account)
    end
  end

  describe '#find_by_email' do
    it 'returns user that matches supplied email' do
      user_repo.create(email: email)

      expect(user_repo.find_by_email(email)).to have_attributes(
        email: email
      )
    end
  end
end
