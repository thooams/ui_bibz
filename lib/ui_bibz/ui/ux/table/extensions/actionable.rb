module UiBibz::Ui::Ux
  class Actionable < UiBibz::Ui::Base

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
      UiBibz::Ui::Core::Dropdown.new(dropdown_action_name, { position: :right, glyph: actions_glyph }, class: 'btn-group-xs dropdown-action').tap do |d|
        unless @actions.nil?
          @actions.format_action.call(record) unless @actions.format_action.nil?
          actions_links(record).each do |l|
            d.html l.to_s.html_safe
          end
          @actions.reset
        end
      end.render
    end

    def actions_glyph
      { name: 'ellipsis-v', type: 'fw' }
    end

    def dropdown_action_name
      defaults = ["ui_bibz.table.actions.defaults.title", 'Actions']
      UiBibz::Utils::Internationalization.new("ui_bibz.table.actions.#{ @store.model.to_s.underscore }.title", default: defaults).translate
    end

    def actions_links record
      @actions.list.compact.map{ |l| inject_url(l, record) }
    end

    def td_action record
      content_tag :td, dropdown_action(record)
    end

  end
end
