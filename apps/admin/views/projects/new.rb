require_relative './new_form'

module Admin
  module Views
    module Projects
      class New
        include Admin::View
        include NewForm
      end
    end
  end
end
