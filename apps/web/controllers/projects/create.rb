module Web
  module Controllers
    module Projects
      class Create
        include Web::Action

        params do
          required(:project).schema do
            required(:source).filled(
              :str?,
              format?: %r{^(git@github.com:\w+\/.+\.git|https:\/\/github.com\/\w+\/.+\.git)$}
            )
          end
        end

        def call(params)
          if params.valid?
            new_project = ProjectRepository.new.create(params[:project])

            redirect_to routes.path(:project, id: new_project.id)
          else
            self.status = 422
          end
        end
      end
    end
  end
end
