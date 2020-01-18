module Admin
  module Controllers
    module Accounts
      class Create
        include Admin::Action

        params do
          required(:account).schema do
            required(:name) { filled? & str? }
            required(:user).schema do
              required(:email) { filled? }
            end
          end
        end

        def call(params)
          if params.valid?
            AccountRepository.new.create(params[:account])
            flash[:message] = 'Check your email to verify your new account'
            Mailers::AccountCreated.deliver(email: params[:account][:user][:email])
            redirect_to Admin.routes.root_path
          else
            self.status = 422
          end
        end
      end
    end
  end
end
