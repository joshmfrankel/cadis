RSpec.describe Mailers::UserRegistered, type: :mailer do
  before do
    Hanami::Mailer.deliveries.clear
  end

  let(:email) { 'test@test@test.com' }

  it 'delivers the email' do
    mail = Mailers::UserRegistered.deliver(email: email)

    expect(mail.to).to eq(email)
    expect(mail.body.encoded).to match(/Thanks for registering/)
    expect(mail.body.encoded).to match(/Please click the link below to verify your email address/)
  end
end
