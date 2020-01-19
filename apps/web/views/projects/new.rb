require_relative './new_form'

module Web
  module Views
    module Projects
      class New
        include Web::View
        include NewForm
      end
    end
  end
end
