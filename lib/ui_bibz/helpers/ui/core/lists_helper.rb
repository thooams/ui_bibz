# frozen_string_literal: true

module UiBibz::Helpers::Ui::Core::ListsHelper
  # List Group Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_list_group(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Lists::ListGroup.new(content, options, html_options).tap(&block).render
  end

  # List Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_list(content = nil, options = nil, html_options = nil, &block)
    if is_tap(content, options)
      UiBibz::Ui::Core::Lists::Components::List.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Lists::Components::List.new(content, options, html_options, &block).render
    end
  end
end
