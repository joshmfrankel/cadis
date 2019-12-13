module Admin
  module Views
    module Repositories
      class New
        include Admin::View

        def form
          form_for :repository, routes.repositories_path do
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
