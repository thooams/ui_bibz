module UiBibz::Ui
  class Actionable < Ui

    def initialize store, options, actions = nil
      @store   = store
      @options = options
      @actions = actions
    end

    def actionable?
      @options[:actionable].nil? ? true : @options[:actionable]
    end

    def header ths
      ths << content_tag(:th, '', class: 'action') if actionable?
      ths
    end

    def body record, tds
      tds << td_action(record) if actionable?
      tds
    end

    # Add "id" in url to match with current record
    def inject_url url, record
      url.gsub(/(\/id\/?)/, "/#{ record.id }/")
    end

  private

    def dropdown_action record
      Dropdown.new dropdown_action_name, { position: :right, glyph: actions_glyph }, class: 'btn-group-xs' do |d|
        actions_links(record)
      end.render
    end

    def actions_glyph
      { name: 'ellipsis-v', size: 1, type: 'fw' }
    end

    def dropdown_action_name
      defaults = ["ui_bibz.grid.actions.defaults.title", 'Actions']
      UiBibz::Utils::Internationalization.new("ui_bibz.grid.actions.#{ @store.model.to_s.underscore }.title", default: defaults).translate
    end

    def actions_links record
      custom_actions(record) || default_actions(record)
    end

    def dropdown_show_name
      defaults = ['ui_bibz.grid.actions.defaults.show', 'Show']
      UiBibz::Utils::Internationalization.new("ui_bibz.grid.actions.#{ @store.model.to_s.underscore }.show", default: defaults).translate
    end

    def dropdown_edit_name
      defaults = ['ui_bibz.grid.actions.defaults.edit', 'Edit']
      UiBibz::Utils::Internationalization.new("ui_bibz.grid.actions.#{ @store.model.to_s.underscore }.edit", default: defaults).translate
    end

    def dropdown_delete_name
      defaults = ['ui_bibz.grid.actions.defaults.delete', 'Delete']
      UiBibz::Utils::Internationalization.new("ui_bibz.grid.actions.#{ @store.model.to_s.underscore }.delete", default: defaults).translate
    end

    def default_actions record
      capture do
        concat LinkAction.new(dropdown_show_name, { controller: @store.controller, action: 'show', id: record.id }, glyph: 'eye').render
        concat LinkAction.new(dropdown_edit_name, { controller: @store.controller, action: 'edit', id: record.id }, glyph: 'pencil').render
        concat LinkAction.new(dropdown_delete_name, { controller: @store.controller, id: record.id }, method: :delete, glyph: 'trash', data: { confirm: 'Are you sure?' }).render
      end
    end

    def custom_actions record
      @actions.split("\n").compact.map{ |l| inject_url(l, record) }.join().html_safe unless @actions.nil?
    end

    def td_action record
      content_tag :td, dropdown_action(record)
    end

  end
end
