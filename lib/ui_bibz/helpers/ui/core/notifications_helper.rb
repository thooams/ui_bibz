# frozen_string_literal: true

module UiBibz::Helpers::Ui::Core::NotificationsHelper
  # Alert Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  def ui_alert(content = nil, options = nil, html_options = nil, &block)
    if tapped?(block)
      UiBibz::Ui::Core::Notifications::Alert.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Notifications::Alert.new(content, options, html_options, &block).render
    end
  end

  # Badge (Label) Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  def ui_badge(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Notifications::Badge.new(content, options, html_options, &block).render
  end

  # ProgressBar Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_progress_bar(percentage = nil, options = nil, html_options = nil, &block)
    if tapped?(block)
      UiBibz::Ui::Core::Notifications::ProgressBar.new(percentage, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Notifications::ProgressBar.new(percentage, options, html_options, &block).render
    end
  end

  # Toast Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_toast(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Notifications::Toast.new(content, options, html_options).tap(&block).render
  end

  # Spinner Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  def ui_spinner(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Notifications::Spinner.new(content, options, html_options, &block).render
  end

  private

  def tapped?(block)
    UiBibz::Utils::Screwdriver.tapped?(block)
  end
end
