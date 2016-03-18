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

  private

    def default_actions?
      @options[:default_actions].nil? ? true : @options[:default_actions]
    end

    def dropdown_action record
      unless @actions.nil?
        @actions.format_action.call(record) unless @actions.format_action.nil?
        unless (default_actions? != true && @actions.raw_list.empty?)
          UiBibz::Ui::Core::ButtonDropdown.new(dropdown_action_name, { position: :right, size: :xs, glyph: actions_glyph }, { class: 'dropdown-action' }).tap do |d|
            actions_links(record).each do |l|
              d.html l.to_s.html_safe
            end
            # Maybe remove this line
            @actions.reset unless @actions.format_action.nil?
          end.render
        end
      end
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
