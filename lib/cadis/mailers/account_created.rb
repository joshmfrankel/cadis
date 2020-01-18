module Mailers
  class AccountCreated
    include Hanami::Mailer

    from    'noreply@cadis.com'
    to      :recipient
    subject 'Please verify your email'

    private

    def recipient
      email
    end
  end
end
