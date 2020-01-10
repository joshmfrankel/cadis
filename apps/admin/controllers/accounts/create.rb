module Admin
  module Controllers
    module Accounts
      class Create
        include Admin::Action

        params do
          required(:account).schema do
            required(:name) { filled? & str? }
          end
        end

        def call(params)
          if params.valid?
            AccountRepository.new.create(params[:account])
            flash[:message] = 'Check your email to verify you\'re new account'
          else
            self.status = 422
          end
        end
      end
    end
  end
end
