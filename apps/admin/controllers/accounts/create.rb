module Admin
  module Controllers
    module Accounts
      class Create
        include Admin::Action

        def call(params)
          # TODO: params validation
          # redirect_to create first user page
        end
      end
    end
  end
end
