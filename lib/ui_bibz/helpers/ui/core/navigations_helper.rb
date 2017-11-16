module UiBibz::Helpers::Ui::Core::NavigationsHelper

  # Nav Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_nav content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Navigations::Nav.new(content, options, html_options).tap(&block).render
  end

  # TabGroup Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_tab_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Navigations::TabGroup.new(content, options, html_options).tap(&block).render
  end

  # Navbar Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_navbar content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Navigations::Navbar.new(content, options, html_options).tap(&block).render
  end

  # Pagination Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_pagination content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Navigations::Pagination.new(content, options, html_options).tap(&block).render
  end

  # Toolbar Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_toolbar content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Navigations::Toolbar.new(content, options, html_options).tap(&block).render
  end

  # Breadcrumb Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  def ui_breadcrumb content = nil, options = nil, html_options = nil, &block
    if block.nil?
      UiBibz::Ui::Core::Navigations::Breadcrumb.new(content, options, html_options, &block).render
    else
      UiBibz::Ui::Core::Navigations::Breadcrumb.new(content, options, html_options).tap(&block).render
    end
  end

end
