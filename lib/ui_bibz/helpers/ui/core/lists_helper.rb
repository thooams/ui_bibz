module UiBibz::Helpers::Ui::Core::ListsHelper

  # List Group Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_list_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Lists::ListGroup.new(content, options, html_options).tap(&block).render
  end

end
