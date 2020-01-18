RSpec.describe Mailers::AccountCreated, type: :mailer do
  before do
    Hanami::Mailer.deliveries.clear
  end

  let(:email) { 'test@test.com' }

  it 'delivers email' do
    mail = Mailers::AccountCreated.deliver(email: email)

    expect(mail.to).to eq([email])
    expect(mail.body.encoded).to match(/Please verify your email address by clicking the below link/)
  end
end
