require "ui_bibz/ui/ux/table/components/table_action"
module UiBibz::Ui::Ux
  class Actions

    def initialize store
      @store   = store
      @actions = []
    end

    # Add action in table
    def action content = nil, options = nil, html_options = nil, &block
      @actions << TableAction.new(content, options, html_options, &block).render
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
        UiBibz::Ui::Ux::TableAction.new(show_name, url: { controller: @store.controller, action: 'show', id: :id }, glyph: 'eye').render,
        UiBibz::Ui::Ux::TableAction.new(edit_name, url:{ controller: @store.controller, action: 'edit', id: :id }, glyph: 'pencil').render,
        UiBibz::Ui::Ux::TableAction.new(delete_name, { glyph: 'trash', url: { controller: @store.controller, action: 'destroy', id: :id }}, data: { confirm: 'Are you sure?', method: :delete }).render
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
