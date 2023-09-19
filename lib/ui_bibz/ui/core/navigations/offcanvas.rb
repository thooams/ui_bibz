# frozen_string_literal: true

require 'ui_bibz/ui/core/navigations/components/offcanvas_header'
require 'ui_bibz/ui/core/navigations/components/offcanvas_body'
module UiBibz::Ui::Core::Navigations
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
  #   UiBibz::Ui::Core::Navigations::Offcanvas.new(options = nil, html_options = nil) do |bt|
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
      @header = UiBibz::Ui::Core::Navigations::Components::OffcanvasHeader.new(content, options, html_options, &)
    end

    def body(content = nil, options = nil, html_options = nil, &)
      @body = UiBibz::Ui::Core::Navigations::Components::OffcanvasBody.new(content, options, html_options, &)
    end

    private

    def component_html_classes
      ['offcanvas', position]
    end

    def component_html_options
      { tabindex: "-1" }
    end

    private

     def position
       "offcanvas-#{options[:position]}" if options[:position]
     end
  end
end
