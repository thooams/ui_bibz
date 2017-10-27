require 'ui_bibz/helpers/ui/core/cards_helper'
require 'ui_bibz/helpers/ui/core/dropdowns_helper'
require 'ui_bibz/helpers/ui/core/forms_helper'
require 'ui_bibz/helpers/ui/core/layouts_helper'
require 'ui_bibz/helpers/ui/core/lists_helper'
require 'ui_bibz/helpers/ui/core/navs_helper'
require 'ui_bibz/helpers/ui/core/paths_helper'
require 'ui_bibz/helpers/ui/core/windows_helper'
module UiBibz::Helpers::Ui::CoreHelper
  include UiBibz::Helpers::Ui::Core::CardsHelper
  include UiBibz::Helpers::Ui::Core::DropdownsHelper
  include UiBibz::Helpers::Ui::Core::FormsHelper
  include UiBibz::Helpers::Ui::Core::LayoutsHelper
  include UiBibz::Helpers::Ui::Core::ListsHelper
  include UiBibz::Helpers::Ui::Core::NavsHelper
  include UiBibz::Helpers::Ui::Core::PathsHelper
  include UiBibz::Helpers::Ui::Core::WindowsHelper

  # Alert Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  def ui_alert content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Core::Notifications::Alert.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Notifications::Alert.new(content, options, html_options, &block).render
    end
  end

  # Glyph Component
  #
  # + content+ (String || Hash) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  # Glyph component with some exeption, it can be written
  # => glyph 'calendar', size: :xs
  # or
  # => glyph { name: 'calendar', size: :xs }
  def ui_glyph content, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Glyph.new(content, options, html_options, &block).render
  end

  # Jumbotron Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_jumbotron content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Jumbotron.new(content, options, html_options, &block).render
  end

  # Badge (Label) Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  def ui_badge content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Badge.new(content, options, html_options, &block).render
  end

  # ProgressBar Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_progress_bar percentage = nil, options = nil, html_options = nil, &block
    if is_tap(percentage, options)
      UiBibz::Ui::Core::Progresses::ProgressBar.new(percentage, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Progresses::ProgressBar.new(percentage, options, html_options, &block).render
    end
  end

  # Stars Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_star content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Star.new(content, options, html_options, &block).render
  end

  private

  def is_tap content, options
    (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
  end

end
