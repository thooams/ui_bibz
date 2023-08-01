# frozen_string_literal: true

module UiBibz::Ui::Core::Notifications
  # Create a badge
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
  #   (+:primary+, +:secondary+, +:success+, +:danger+, +:warning+, +:info+, +:light+, +:dark+)
  # * +glyph+ - [String | Hash] Add glyph with name or hash options
  #   * +name+ - [String]
  #   * +url+ - [String] Transform span to link
  # * +type+ - [Symbol]
  #   (+:pill+, +:square+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Notifications::Badge.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Notifications::Badge.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Notifications::Badge.new(content, status: :success, type: :pill).render
  #
  #   UiBibz::Ui::Core::Notifications::Badge.new() do
  #     #content
  #   end.render
  #
  # ==== Helper
  #
  #   ui_badge(content, options = {}, html_options = {})
  #
  #   ui_badge(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Badge < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag options[:url].nil? ? :span : :a, glyph_and_content_html, html_options
    end

    private

    def component_html_options
      super.merge(options[:url].nil? ? {} : { href: options[:url] })
    end

    def validations
      UiBibz::Validators::IncludeArrayValidator.new(STATUS, @options[:status]).validate
      UiBibz::Validators::IncludeArrayValidator.new(SIZES, @options[:size]).validate
    end


    ### HTML classes ###########################################################
    def component_html_classes
      html_classes_builder.add_if_equal_value 'rounded-pill', options[:type], :pill
      html_classes_builder.add_composed 'bg-%s', options[:status]
      html_classes_builder.add 'badge'
    end
  end
end
