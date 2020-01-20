module Mailers
  class UserRegistered
    include Hanami::Mailer

    from 'noreply@cadis.com'
    to :recipient
    subject 'Please verify your user email address'

    private

    def recipient
      email
    end
  end
end
