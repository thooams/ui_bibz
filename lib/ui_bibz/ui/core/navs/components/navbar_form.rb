require 'haml'
module UiBibz::Ui::Core::Navs

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
  #   UiBibz::Ui::Core::Navs::NavbarForm.new(options = nil, html_options = nil) do |f|
  #     f.text_field :field
  #     f.submit 'Submit'
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navs::NavbarForm.new(position: :right) do |f|
  #     f.text_field :field
  #     f.submit 'Submit'
  #   end.render
  #
  #   UiBibz::Ui::Core::Navs::NavbarForm.new('/search', type: :form_tag) do
  #     text_field_tag :field
  #     submit_tag 'Submit'
  #   end.render
  #
  class NavbarForm < UiBibz::Ui::Base
    include Haml::Helpers
    include ActionView::Helpers#::FormHelper

    def initialize model_or_url, options = {}, &block
      init_haml_helpers
      @options = options
      if type == :form_for
        @form = form_for(model_or_url, options, &block)
      else
        @form = form_tag(model_or_url, class: "navbar-form form-inline #{ position }", &block)
      end
    end

    # Render html tag
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
      "pull-#{ @options[:position] }" unless @options[:position].nil?
    end

  end
end
