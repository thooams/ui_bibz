module UiBibz::Ui::Core

  # Create DropdownDivider
  #
  class DropdownDivider < UiBibz::Ui::Base

    # See UiBibz::Ui::Core::Component.initialize
    def initialize
    end

    # Render html tag
    def render
      content_tag :div, nil, class: 'dropdown-divider'
    end

  end
end
