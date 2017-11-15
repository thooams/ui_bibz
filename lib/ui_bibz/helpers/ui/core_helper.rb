require 'ui_bibz/helpers/ui/core/cards_helper'
require 'ui_bibz/helpers/ui/core/dropdowns_helper'
require 'ui_bibz/helpers/ui/core/forms_helper'
require 'ui_bibz/helpers/ui/core/layouts_helper'
require 'ui_bibz/helpers/ui/core/icons_helper'
require 'ui_bibz/helpers/ui/core/lists_helper'
require 'ui_bibz/helpers/ui/core/notifications_helper'
require 'ui_bibz/helpers/ui/core/navigations_helper'
require 'ui_bibz/helpers/ui/core/windows_helper'
module UiBibz::Helpers::Ui::CoreHelper
  include UiBibz::Helpers::Ui::Core::CardsHelper
  include UiBibz::Helpers::Ui::Core::DropdownsHelper
  include UiBibz::Helpers::Ui::Core::FormsHelper
  include UiBibz::Helpers::Ui::Core::LayoutsHelper
  include UiBibz::Helpers::Ui::Core::IconsHelper
  include UiBibz::Helpers::Ui::Core::ListsHelper
  include UiBibz::Helpers::Ui::Core::NavigationsHelper
  include UiBibz::Helpers::Ui::Core::NotificationsHelper
  include UiBibz::Helpers::Ui::Core::WindowsHelper



  # Jumbotron Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_jumbotron content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Jumbotron.new(content, options, html_options, &block).render
  end


  private

  def is_tap content, options
    (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
  end

end
