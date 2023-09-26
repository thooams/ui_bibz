# frozen_string_literal: true

require 'haml'
module UiBibz::Ui::Core::Navigations
  # Create a ToolbarForm
  #
  # This element is an extend of ActionView::Helpers::FormHelper::FormFor to Rails
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
  #
  #   http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-form_for
  #   # and
  #   http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-form_tag
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navigations::ToolbarForm.new(options = nil, html_options = nil) do |f|
  #     f.text_field :field
  #     f.submit 'Submit'
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navigations::ToolbarForm.new(position: :right) do |f|
  #     f.text_field :field
  #     f.submit 'Submit'
  #   end.render
  #
  #   UiBibz::Ui::Core::Navigations::ToolbarForm.new('/search', type: :form_tag) do
  #     text_field_tag :field
  #     submit_tag 'Submit'
  #   end.render
  #
  class ToolbarForm < UiBibz::Ui::Base
    include Haml::Helpers
    include SimpleForm::ActionViewExtensions::FormHelper if defined?(SimpleForm)
    include UiBibz::Helpers::UtilsHelper
    include ActionView::Helpers

    attr_accessor :html_options

    def initialize(model_or_url, options = {}, &block)
      # init_haml_helpers
      @content      = block
      @model_or_url = model_or_url
      @options      = options
      @html_options = %i[form_for ui_form_for].exclude?(type) ? html_options_for_form(@model_or_url, new_option) : new_option
    end

    # Render html tag
    def render
      case type
      when :form_for
        @form = form_for(@model_or_url, html_options, &@content)
      when :ui_form_for
        begin
          @form = ui_form_for(@model_or_url, html_options, &@content)
        rescue e
          raise 'You must install simple form to use ui_form_for.'
        end
      else
        @form = form_tag_with_body(html_options, capture(&@content))
      end
    end

    private

    def new_option
      (@options || {}).merge({ class: UiBibz::Builders::HtmlClassesBuilder.join_classes('btn-group', @options[:class]) })
    end

    def protect_against_forgery?
      false
    end

    def url
      @options[:url]
    end

    def type
      @options[:type] || :form_for
    end
  end
end
