RSpec.describe Web::Controllers::Users::Create, type: :action do
  let(:action) { described_class.new }
  let(:email) { 'test@test@test.com' }
  let(:params) { Hash[user: { email: email, password: '1234' }] }
  let(:user_repo) { UserRepository.new }

  before do
    user_repo.clear
  end

  it 'registers a user' do
    action.call(params)
    created_user = user_repo.find_by_email(email)

    expect(created_user).to have_attributes(
      id: Integer,
      email: email,
      encrypted_password: String,
      confirmation_token: String
    )
    expect(created_user.encrypted_password.size).to eq(60)
    expect(created_user.confirmation_token.size).to eq(40)
  end

  pending 'does not register user if email exists'

  it 'sends an email to verify the user email supplied' do
    expect(Mailers::UserRegistered).to receive(:deliver).with(email: email, confirmation_token: String)

    action.call(params)
  end
end
