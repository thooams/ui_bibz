module UiBibz::Helpers::Ui::Core::NavsHelper

  # Nav Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_nav content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Navs::Nav.new(content, options, html_options).tap(&block).render
  end

  # Navbar Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_navbar content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Navs::Navbar.new(content, options, html_options).tap(&block).render
  end

  # Pagination Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_pagination content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Navs::Pagination.new(content, options, html_options).tap(&block).render
  end

end
