require 'ui_bibz/ui/core/dropdown/components/dropdown_header'
require 'ui_bibz/ui/core/dropdown/components/dropdown_divider'
require 'ui_bibz/ui/core/dropdown/components/dropdown_link'
module UiBibz::Ui::Ux
  class Actions

    def initialize store
      @store        = store
      @actions      = []
      @action_order = -1
    end

    # Add link action in table
    def link content = nil, options = nil, html_options = nil, &block
      @actions << UiBibz::Ui::Core::DropdownLink.new(content, options, html_options, &block).render
    end

    def divider
      @actions << UiBibz::Ui::Core::DropdownDivider.new.render
    end

    def header content = nil, options = nil, html_options = nil, &block
      @actions << UiBibz::Ui::Core::DropdownHeader.new(content, options, html_options, &block).render
    end

    def reset
      @actions = []
    end

    def format &block
      @format_action = block
    end

    # Get all actions
    def list
      @actions.empty? ? defaults_actions : @actions
    end

    def format_action
      @format_action
    end

  private

    def defaults_actions
      [
        UiBibz::Ui::Core::DropdownLink.new(show_name, url: { controller: @store.controller, action: 'show', id: :id }, glyph: 'eye').render,
        UiBibz::Ui::Core::DropdownLink.new(edit_name, url:{ controller: @store.controller, action: 'edit', id: :id }, glyph: 'pencil').render,
        UiBibz::Ui::Core::DropdownLink.new(delete_name, { glyph: 'trash', url: { controller: @store.controller, action: 'destroy', id: :id }}, data: { confirm: 'Are you sure?', method: :delete }).render
      ]
    end

    def show_name
      defaults = ['ui_bibz.table.actions.defaults.show', 'Show']
      UiBibz::Utils::Internationalization.new("ui_bibz.table.actions.#{ @store.model.to_s.underscore }.show", default: defaults).translate
    end

    def edit_name
      defaults = ['ui_bibz.table.actions.defaults.edit', 'Edit']
      UiBibz::Utils::Internationalization.new("ui_bibz.table.actions.#{ @store.model.to_s.underscore }.edit", default: defaults).translate
    end

    def delete_name
      defaults = ['ui_bibz.table.actions.defaults.delete', 'Delete']
      UiBibz::Utils::Internationalization.new("ui_bibz.table.actions.#{ @store.model.to_s.underscore }.delete", default: defaults).translate
    end

  end
end
