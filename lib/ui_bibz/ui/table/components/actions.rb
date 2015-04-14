require "ui_bibz/ui/table/components/table_action"
module UiBibz::Ui
  class Actions

    def initialize store
      @store   = store
      @actions = []
    end

    def action content = nil, options = nil, html_options = nil, &block
      @actions << TableAction.new(content, options, html_options, &block).render
    end

    def list
      @actions.empty? ? defaults_actions : @actions
    end

  private

    def defaults_actions
      [
        TableAction.new(show_name, url: { controller: @store.controller, action: 'show', id: :id }, glyph: 'eye').render,
        TableAction.new(edit_name, url:{ controller: @store.controller, action: 'edit', id: :id }, glyph: 'pencil').render,
        TableAction.new(delete_name, url: { controller: @store.controller, id: :id }, method: :delete, glyph: 'trash', data: { confirm: 'Are you sure?' }).render,
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
