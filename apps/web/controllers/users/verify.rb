module Web
  module Controllers
    module Users
      class Verify
        include Web::Action

        params do
          required(:id).filled
          required(:confirmation_token).filled
        end

        def call(params)
          if params.valid?
            user = UserRepository.new.find_by_id_and_confirmation_token(
              id: params[:id],
              confirmation_token: params[:confirmation_token]
            )

            unless user.nil?
              UserRepository.new.update(user.id, confirmed: true)
              flash[:message] = 'Email verified'
            end

            redirect_to Web.routes.root_path
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
