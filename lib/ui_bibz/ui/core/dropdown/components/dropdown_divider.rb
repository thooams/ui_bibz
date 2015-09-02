module UiBibz::Ui::Core

  # Create DropdownDivider
  #
  class DropdownDivider < UiBibz::Ui::Base

    # See UiBibz::Ui::Core::Component.initialize
    def initialize
    end

    # Render html tag
    def render
      content_tag :li, nil, class: 'divider', role: 'separator'
    end

  end
end
