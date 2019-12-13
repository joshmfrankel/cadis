module Admin
  module Controllers
    module Repositories
      class Show
        include Admin::Action

        expose :repository

        def call(params)
          @repository = RepositoryRepository.new.find(params[:id])
        end
      end
    end
  end
end
