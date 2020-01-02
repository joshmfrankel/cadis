module Admin
  module Views
    module Projects
      module NewForm
        def form
          form_for :project, routes.projects_path do
            div class: 'input' do
              label :source
              text_field :source
            end

            submit 'Submit'
          end
        end
      end
    end
  end
end
