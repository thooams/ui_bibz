# frozen_string_literal: true

require 'ui_bibz/ui/core/windows/components/offcanvas_header'
require 'ui_bibz/ui/core/windows/components/offcanvas_body'
module UiBibz::Ui::Core::Windows
  # Create a offcanvas
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # * +status+ - status of element with +symbol+ value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+ - Size of element with +symbol+ value:
  #   (+:xs+, +:sm+, +:lg+)
  # * +position+ - Position vertical or horizontal with +symbol+ value:
  #   (+:vertical+, +:horizontal+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Windows::Offcanvas.new(options = nil, html_options = nil) do |bt|
  #     ...
  #   end
  #
  # ==== Examples
  #
  class Offcanvas < UiBibz::Ui::Core::Component
    # Render html tag
    def pre_render
      content_tag :div, html_options do
        concat @header&.render
        concat @body&.render
      end
    end

    def header(content = nil, options = nil, html_options = nil, &)
      @header = UiBibz::Ui::Core::Windows::Components::OffcanvasHeader.new(content, options, html_options, &)
    end

    def body(content = nil, options = nil, html_options = nil, &)
      @body = UiBibz::Ui::Core::Windows::Components::OffcanvasBody.new(content, options, html_options, &)
    end

    private

    def component_html_classes
      ['offcanvas', position]
    end

    def component_html_options
      { tabindex: '-1' }
    end

    def position
      "offcanvas-#{options[:position] || 'start'}"
    end

    def component_html_data
      super
      backdrop
      scrollable
    end

    def backdrop
      return unless @options[:backdrop]

      @data_html_options_builder.add 'bs-backdrop', value: @options[:backdrop]
    end

    def scrollable
      return unless @options[:scrollable]

      @data_html_options_builder.add 'bs-scroll', value: @options[:scrollable]
    end
  end
end
