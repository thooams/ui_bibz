module UiBibz::Helpers::Ui::Core::PathsHelper

  # Breadcrumb Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  def ui_breadcrumb content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Core::Paths::Breadcrumb.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Paths::Breadcrumb.new(content, options, html_options, &block).render
    end
  end

end
