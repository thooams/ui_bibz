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
  class NavbarForm < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      @form = form_for(content, options, html_options, &block)
    end

    def render
      @form
    end

  end
end
