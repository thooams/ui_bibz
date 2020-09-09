# frozen_string_literal: true

module UiBibz::Ui::Ux::Tables
  # Create a Thead
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
  # * +status+ - status of element with symbol value:
  #   (+:inverse+, +:default+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Ux::Thead.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Ux::Thead.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Ux::Thead.new(content, { status: :inverse }).render
  #
  class Thead < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :thead, content, html_options
    end

    private

    def status
      "thead-#{@options[:status]}" unless @options[:status].nil?
    end
  end
end
