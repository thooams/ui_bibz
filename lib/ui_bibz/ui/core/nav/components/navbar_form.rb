require 'haml'
module UiBibz::Ui::Core

  # Create a NavbarForm
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
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::NavbarForm.new(options = nil, html_options = nil) do |f|
  #     f.text_field :field
  #     f.submit 'Submit'
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::NavbarForm.new(position: :right) do |f|
  #     f.text_field :field
  #     f.submit 'Submit'
  #   end.render
  #
  #   UiBibz::Ui::Core::NavbarForm.new('/search', type: :form_tag) do
  #     text_field_tag :field
  #     submit_tag 'Submit'
  #   end.render
  #
  class NavbarForm < Component
    include Haml::Helpers

    def initialize content, options = nil, html_options = nil, &block
      super
      init_haml_helpers
      if type == :form_for
        @form = form_for(content, &block)
      else
        ap block
        @form = form_tag(url, class_and_html_options(['navbar-form', position]), &block)
      end
    end

    def render
      @form
    end

  private

    def protect_against_forgery?
      false
    end

    def url
      @options[:url]
    end

    def type
      @options[:type] || :form_for
    end

    def position
      "navbar-#{ @options[:position] }" unless @options[:position].nil?
    end

  end
end
