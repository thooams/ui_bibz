# frozen_string_literal: true

require 'ui_bibz/ui/core/forms/dropdowns/components/dropdown_header'
require 'ui_bibz/ui/core/forms/dropdowns/components/dropdown_divider'
require 'ui_bibz/ui/core/forms/dropdowns/components/dropdown_link'
module UiBibz::Ui::Ux::Tables
  class Actions
    def initialize(store)
      @store        = store
      @actions      = []
      @action_order = -1
    end

    # Add link action in table
    def link(content = nil, options = nil, html_options = nil, &)
      @actions << UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownLink.new(content, options, html_options, &).render
    end

    def divider
      @actions << UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownDivider.new.render
    end

    def header(content = nil, options = nil, html_options = nil, &)
      @actions << UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownHeader.new(content, options, html_options, &).render
    end

    def html(content)
      @actions << content
    end

    def reset
      @actions = []
    end

    def format(&block)
      @format_action = block
    end

    # Get all actions
    def list
      @actions.empty? ? defaults_actions : @actions
    end

    def raw_list
      @actions
    end

    attr_reader :format_action

    private

    def defaults_actions
      [
        UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownLink.new(show_name, url: { controller: @store.actions_controller, action: 'show' }.merge({ @store.id_key => @store.id_key }), glyph: 'eye').render,
        UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownLink.new(edit_name, url: { controller: @store.actions_controller, action: 'edit' }.merge({ @store.id_key => @store.id_key }), glyph: 'edit').render,
        UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownLink.new(delete_name, { glyph: 'trash', url: { controller: @store.actions_controller, action: 'destroy' }.merge({ @store.id_key => @store.id_key }), link_html_options: { data: { confirm: 'Are you sure?', method: :delete } } }).render
      ]
    end

    def show_name
      defaults = ['ui_bibz.table.actions.defaults.show', 'Show']
      UiBibz::Utils::Internationalization.new("ui_bibz.table.actions.#{@store.model.to_s.underscore}.show", default: defaults).translate
    end

    def edit_name
      defaults = ['ui_bibz.table.actions.defaults.edit', 'Edit']
      UiBibz::Utils::Internationalization.new("ui_bibz.table.actions.#{@store.model.to_s.underscore}.edit", default: defaults).translate
    end

    def delete_name
      defaults = ['ui_bibz.table.actions.defaults.delete', 'Delete']
      UiBibz::Utils::Internationalization.new("ui_bibz.table.actions.#{@store.model.to_s.underscore}.delete", default: defaults).translate
    end
  end
end
