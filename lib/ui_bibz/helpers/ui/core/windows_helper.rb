# frozen_string_literal: true

module UiBibz::Helpers::Ui::Core::WindowsHelper
  # Modal Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_modal(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Windows::Modal.new(content, options, html_options).tap(&).render
  end

  # Offcanvas Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_offcanvas(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Windows::Offcanvas.new(content, options, html_options).tap(&).render
  end
end
