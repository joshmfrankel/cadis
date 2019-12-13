module Admin
  module Controllers
    module Repositories
      class Create
        include Admin::Action

        params do
          required(:repository).schema do
            required(:source).filled(
              :str?,
              format?: %r{^(git@github.com:\w+\/.+\.git|https:\/\/github.com\/\w+\/.+\.git)$}
            )
          end
        end

        def call(params)
          if params.valid?
            new_repo = RepositoryRepository.new.create(params[:repository])

            redirect_to routes.path(:repository, id: new_repo.id)
          else
            halt 422
          end
        end
      end
    end
  end
end
