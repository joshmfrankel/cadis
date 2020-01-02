module Admin
  module Controllers
    module Projects
      class Show
        include Admin::Action

        expose :project

        def call(params)
          @project = ProjectRepository.new.find(params[:id])
        end
      end
    end
  end
end
