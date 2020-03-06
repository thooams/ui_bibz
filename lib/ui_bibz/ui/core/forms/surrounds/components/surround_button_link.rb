# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Surrounds
  class SurroundButtonLink < UiBibz::Ui::Core::Forms::Buttons::ButtonLink
    # See UiBibz::Ui::Core::Dropdown.initialize
    def initialize(content, options = nil, html_options = nil, &block)
      super
    end

    def pre_render
      content_tag :div, class: 'input-group-btn' do
        button_link_html_tag
      end
    end
  end
end
