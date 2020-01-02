require_relative './new_form'

module Admin
  module Views
    module Projects
      class Create
        include Admin::View
        include NewForm
        template 'projects/new'

        # messages :i18n
      end
    end
  end
end
