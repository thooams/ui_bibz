module UiBibz::Helpers::Ui::Core::PathsHelper

  # Breadcrumb Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  def ui_breadcrumb content = nil, options = nil, html_options = nil, &block
    if block.nil?
      UiBibz::Ui::Core::Paths::Breadcrumb.new(content, options, html_options, &block).render
    else
      UiBibz::Ui::Core::Paths::Breadcrumb.new(content, options, html_options).tap(&block).render
    end
  end

end
