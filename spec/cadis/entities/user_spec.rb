RSpec.describe User, type: :entity do
  it 'allows a name to be set' do
    user = User.new(name: 'Cirilla')
    expect(user.name).to eq('Cirilla')
  end

  it 'allows an email to be set' do
    user = User.new(email: 'geralt@rivia.com')
    expect(user.email).to eq('geralt@rivia.com')
  end

  it 'allows an account_id to be set' do
    user = User.new(account_id: 3)
    expect(user.account_id).to eq(3)
  end
end
