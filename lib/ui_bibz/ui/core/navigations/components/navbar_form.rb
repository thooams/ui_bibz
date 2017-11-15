require 'haml'
module UiBibz::Ui::Core::Navigations

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
  #   # and
  #   http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-form_tag
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navigations::NavbarForm.new(options = nil, html_options = nil) do |f|
  #     f.text_field :field
  #     f.submit 'Submit'
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navigations::NavbarForm.new(position: :right) do |f|
  #     f.text_field :field
  #     f.submit 'Submit'
  #   end.render
  #
  #   UiBibz::Ui::Core::Navigations::NavbarForm.new('/search', type: :form_tag) do
  #     text_field_tag :field
  #     submit_tag 'Submit'
  #   end.render
  #
  class NavbarForm < UiBibz::Ui::Base
    include Haml::Helpers
    include SimpleForm::ActionViewExtensions::FormHelper
    include UiBibz::Helpers::UtilsHelper
    include ActionView::Helpers#::FormHelper

    def initialize model_or_url, options = {}, &block
      init_haml_helpers
      @options = options
      case type
      when :form_for
        @form = form_for(model_or_url, new_option, &block)
      when :ui_form_for
        @form = ui_form_for(model_or_url, new_option, &block)
      else
        #@form = form_tag(model_or_url, class: "navbar-form form-inline #{ position }", block)
        html_options = html_options_for_form(model_or_url, new_option)
        @form = form_tag_with_body(html_options, capture(&block))
      end
    end

    # Render html tag
    def render
      @form
    end

  private

    def new_option
      (@options || {}).merge({ class: "navbar-form form-inline #{ position } my-2 my-lg-0" })
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

    def position
      "pull-#{ @options[:position] }" unless @options[:position].nil?
    end

  end
end
