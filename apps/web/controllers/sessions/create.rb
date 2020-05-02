module Web
  module Controllers
    module Sessions
      class Create
        include Web::Action

        params do
          required(:session).schema do
            required(:email).filled
            required(:password).filled
          end
        end

        def call(params)
          if params.valid?
            user = UserRepository.new.find_by_email(params[:session][:email])
            if user.password == params[:session][:password]
              session[:user_id] = user.id
              flash[:message] = 'Successfully logged in'
            else
              self.status = 401
            end
          else
            self.status = 422
          end
        end

        private

        def authenticate!; end
      end
    end
  end
end
