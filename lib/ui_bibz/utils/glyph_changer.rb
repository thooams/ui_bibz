# frozen_string_literal: true

module UiBibz::Utils
  # Glyph changer
  #
  #  => ui_link 'My link', url: '#', glyph: { type: :group, items: [{ name: 'circle', stataus: :danger },{ name: 'times', inverse: true, transform:'shrink-6'}] }
  class GlyphChanger
    def initialize(glyph_options, options = {})
      @glyph_options = glyph_options
      @options       = options
    end

    def render
      @glyph_options.is_a?(Hash) ? glyph_or_glyph_group : glyph_by_hash
    end

    private

    def glyph_or_glyph_group
      @glyph_options[:type] == :group ? transform_to_glyph_group : glyph_by_hash
    end

    def format_opts
      glyph_name      = @glyph_options.try(:[], :name)
      glyph_opts      = @glyph_options
      glyph_html_opts = @options[:html_options] || {}
      # glyph_html_opts = glyph_html_opts.merge(@options[:text] ? {} : { title: @options[:content] })
      glyph_items     = @glyph_options.try(:[], :items) || []

      [glyph_name, glyph_opts, glyph_html_opts, glyph_items]
    end

    def glyph_by_hash
      if @glyph_options.is_a?(Hash)
        glyph_name, glyph_opts, glyph_html_opts = format_opts
      else
        glyph_name      = @glyph_options
        glyph_opts      = @options
        # title           = [(@options[:content] unless @options[:text]), ("<kbd>#{ @options[:shortcut] }</kbd>" unless @options[:shortcut].nil?)].compact.join(" ")
        glyph_html_opts = @options[:html_options] || {}
        # glyph_html_opts = glyph_html_opts.merge(title.blank? ? {} : { title: title.html_safe })
      end

      UiBibz::Ui::Core::Icons::Glyph.new(glyph_name, glyph_opts, glyph_html_opts).render unless glyph_name.nil?
    end

    def transform_to_glyph_group
      _, glyph_opts, glyph_html_opts, glyph_items = format_opts

      UiBibz::Ui::Core::Icons::GlyphGroup.new(glyph_opts, glyph_html_opts).tap do |gg|
        glyph_items.each do |item|
          gg.send(item[:type] || :glyph, item[:name] || item[:content], item, item[:html_options] || {})
        end
      end.render
    end
  end
end
