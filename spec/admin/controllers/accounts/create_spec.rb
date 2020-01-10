RSpec.describe Admin::Controllers::Accounts::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[account: { name: 'My First Account' }] }
  let(:repo) { AccountRepository.new }

  before do
    repo.clear
  end

  it 'creates a new account' do
    action.call(params)
    created_account = repo.last

    expect(created_account.id).not_to be_nil
  end

  it 'displays successful flash message' do
    action.call(params)

    flash = action.exposures[:flash]

    expect(flash[:message]).to eq('Check your email to verify you\'re new account')
  end

  context 'for invalid parameters' do
    it 'responds with 422 when Account Name is empty' do
      params = Hash[account: { name: nil }]
      response = action.call(params)

      expect(response[0]).to eq(422)
    end

    it 'responds with 422 when Account Name is not a string' do
      params = Hash[account: { name: 1234 }]
      response = action.call(params)

      expect(response[0]).to eq(422)
    end
  end
end
