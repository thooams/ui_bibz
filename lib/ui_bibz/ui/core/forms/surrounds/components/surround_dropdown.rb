module UiBibz::Ui::Core::Forms::Surrounds
  class SurroundDropdown < UiBibz::Ui::Core::Dropdowns::Dropdown

    # See UiBibz::Ui::Core::Dropdown.initialize
    def initialize content, options = nil, html_options  = nil, &block
      super
    end

    private

    def component_html_classes
      super << 'input-group-btn'
    end

  end
end
