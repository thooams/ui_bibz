# frozen_string_literal: true

module UiBibz::Helpers::Ui::Core::LayoutsHelper
  # Row Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_row(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Layouts::Row.new(content, options, html_options, &block).render
  end

  # Col Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_col(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Layouts::Col.new(content, options, html_options, &block).render
  end

  # Container Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_container(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Layouts::Container.new(content, options, html_options, &block).render
  end
end
