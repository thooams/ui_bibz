module UiBibz::Helpers::Ui::Core::WindowsHelper

  # Modal Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_modal content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Windows::Modal.new(content, options, html_options).tap(&block).render
  end

end
