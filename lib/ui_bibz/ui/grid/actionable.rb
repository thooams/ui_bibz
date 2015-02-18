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
      # TODO: Fix links without eval

      Dropdown.new 'Action', { position: :right, glyph: { name: 'ellipsis-v', size: 1, type: 'fw' }}, class: 'btn-group-xs' do |d|
        actions = custom_actions(record) || default_actions(record)
        content_tag :li, actions, role: 'presentation'
      end.render
    end

    def default_actions record
      capture do
        glyph = Glyph.new(name: 'eye', type: 'fw').render
        name  = "#{ glyph } Show".html_safe
        concat link_to name, { controller: @store.controller, action: 'show', id: record.id }, role: "menuitem",  tabindex: "-1"
        glyph = Glyph.new(name: 'pencil', type: 'fw').render
        name  = "#{ glyph } Edit".html_safe
        concat link_to name, { controller: @store.controller, action: 'edit', id: record.id }, role: "menuitem",  tabindex: "-1"
        glyph = Glyph.new(name: 'trash', type: 'fw').render
        name  = "#{ glyph } Delete".html_safe
        concat link_to name, { controller: @store.controller, id: record.id }, method: :delete, data: { confirm: 'Are you sure?' }, role: "menuitem",  tabindex: "-1"
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
