# frozen_string_literal: true

require 'ui_bibz/ui/extensions/core/forms/connect_extension'
module SurroundExtension
  include ConnectExtension

  private

  def surrounded?
    !options[:append].nil? || !options[:prepend].nil? || !options[:refresh].nil? || !options[:surrounded].nil?
  end

  def surround_wrapper_tag ct_tag
    UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new(class: surround_classes).tap do |sf|
      sf.addon options[:append]           unless options[:append].nil?
      sf.html ct_tag
      sf.button_refresh connect_opts      unless options[:refresh].nil?
      sf.addon options[:prepend]          unless options[:prepend].nil?
    end.render
  end

  def surround_field field_tag, options = {}
    surrounded? ? surround_wrapper_tag(field_tag) : field_tag
  end

  def input_group_classes
  end

  def surround_classes
    [input_group_refresh, input_group_classes]
  end

  def input_group_refresh
    "field-refresh" unless options[:refresh].nil?
  end

  def input_group_classes
    [input_group_status, input_group_size]
  end

  # :lg, :sm or :xs
  def input_group_size
    "input-group-#{ options[:size] }" unless options[:size].nil?
  end

  def input_group_status
    "has-#{ options[:status] }" unless options[:status].nil?
  end

end
