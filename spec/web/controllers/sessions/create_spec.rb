RSpec.describe Web::Controllers::Sessions::Create, type: :action do
  let(:action) { described_class.new }

  before do
    UserRepository.new.clear
  end

  context 'with valid credentials' do
    it 'successfully logs the user in' do
      user = UserRepository.new.create(
        name: 'Ciri',
        email: 'ciri@cintra.gov',
        encrypted_password: BCrypt::Password.create('Lion Cub of Cintra')
      )

      params = Hash[session: { email: user.email, password: 'Lion Cub of Cintra' }]

      response = action.call(params)

      expect(response[0]).to eq(200)
      expect(params['rack.session'][:user_id]).to eq(user.id)
    end
  end

  context 'with invalid credentials' do
    it 'responds with failed login attempt' do
      user = UserRepository.new.create(
        name: 'Ciri',
        email: 'ciri@cintra.gov',
        encrypted_password: BCrypt::Password.create('Lion Cub of Cintra')
      )

      params = Hash[session: { email: user.email, password: 'Not the same password' }]

      response = action.call(params)

      expect(response[0]).to eq(401)
      expect(params['rack.session'][:user_id]).to be_nil
    end
  end

  context 'with missing form fields' do
    it 'responds with 422 when email is missing' do
      params = Hash[session: { email: nil }]
      response = action.call(params)

      expect(response[0]).to eq(422)
    end

    it 'responds with 422 when password is missing' do
      params = Hash[session: { password: nil }]
      response = action.call(params)

      expect(response[0]).to eq(422)
    end
  end
end
