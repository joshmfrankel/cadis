RSpec.describe Web::Controllers::Users::Verify, type: :action do
  let(:action) { described_class.new }
  let(:user_repo) { UserRepository.new }

  before do
    user_repo.clear
  end

  it 'verifies a user' do
    existing_user = user_repo.create(
      email: 'dudu@navigrad.com',
      encrypted_password: '1234',
      confirmation_token: 'asdf'
    )

    params = {
      id: existing_user.id,
      confirmation_token: existing_user.confirmation_token
    }

    response = action.call(params)

    expect(user_repo.find(existing_user.id)).to have_attributes(
      id: existing_user.id,
      confirmation_token: existing_user.confirmation_token,
      confirmed: true
    )
    expect(response[0]).to eq(302)
    expect(response[1]['Location']).to eq(Web.routes.root_path)
  end

  it 'does not verify invalid users' do
    existing_user = user_repo.create(
      email: 'dudu@navigrad.com',
      encrypted_password: '1234',
      confirmation_token: 'asdf'
    )

    params = {
      id: 500_000,
      confirmation_token: existing_user.confirmation_token
    }

    response = action.call(params)

    expect(user_repo.find(existing_user.id)).to have_attributes(
      id: existing_user.id,
      confirmation_token: existing_user.confirmation_token,
      confirmed: nil
    )
    expect(response[0]).to eq(302)
    expect(response[1]['Location']).to eq(Web.routes.root_path)
  end

  it 'requires params[:id]' do
    params = {
      id: nil,
      confirmation_token: 'asdf'
    }

    response = action.call(params)

    expect(response[0]).to eq(422)
  end

  it 'requires params[:confirmation_token]' do
    params = {
      id: 500_000,
      confirmation_token: nil
    }

    response = action.call(params)

    expect(response[0]).to eq(422)
  end
end
