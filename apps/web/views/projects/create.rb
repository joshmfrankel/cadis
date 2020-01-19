require_relative './new_form'

module Web
  module Views
    module Projects
      class Create
        include Web::View
        include NewForm
        template 'projects/new'

        # messages :i18n
      end
    end
  end
end
