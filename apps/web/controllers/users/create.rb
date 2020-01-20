require 'bcrypt'

module Web
  module Controllers
    module Users
      class Create
        include Web::Action

        def call(params)
          user_params = params[:user].merge(
            encrypted_password: encrypted_password,
            confirmation_token: SecureRandom.hex(20)
          )
          user_params.delete(:password)

          UserRepository.new.create(user_params)
          Mailers::UserRegistered.deliver(email: user_params[:email], confirmation_token: user_params[:confirmation_token])
        end

        private

        def encrypted_password
          BCrypt::Password.create(params[:user][:password], cost: 12)
        end
      end
    end
  end
end