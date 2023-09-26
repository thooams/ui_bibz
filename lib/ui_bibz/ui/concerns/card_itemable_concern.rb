# frozen_string_literal: true

module UiBibz::Ui::Concerns::CardItemableConcern # :nodoc:
  extend ActiveSupport::Concern
  include UiBibz::Ui::Concerns::HtmlConcern

  included do
    # Add Header which is a component
    def header(content = nil, options = nil, html_options = nil, &block)
      options, content = inherit_options(content, options, block)
      @header = if tapped?(block)
                  UiBibz::Ui::Core::Boxes::Components::CardHeader.new(content, options, html_options).tap(&block).render
                else
                  UiBibz::Ui::Core::Boxes::Components::CardHeader.new(content, options, html_options, &block).render
                end
    end

    # Add Body div which is a component
    def body(content = nil, options = nil, html_options = nil, &block)
      options, content = inherit_options(content, options, block)
      if tapped?(block)
        content = (content || {}).merge(collapse: options.try(:[], :collapse), parent_collapse: @options[:parent_collapse])
        @items << UiBibz::Ui::Core::Boxes::Components::CardBody.new(content, options, html_options).tap(&block).render
      else
        options = (options || {}).merge(collapse: options.try(:[], :collapse), parent_collapse: @options[:parent_collapse])
        @items << UiBibz::Ui::Core::Boxes::Components::CardBody.new(content, options, html_options, &block).render
      end
    end

    # Add Footer which is a component
    def footer(content = nil, options = nil, html_options = nil, &block)
      options, content = inherit_options(content, options, block)
      @footer = UiBibz::Ui::Core::Boxes::Components::CardFooter.new(content, options, html_options, &block).render
    end

    # Add List group which is a component
    def list_group(content = nil, options = nil, html_options = nil, &)
      @items << UiBibz::Ui::Core::Boxes::Components::CardListGroup.new(content, options, html_options).tap(&).render
    end

    # Add Image which is a component
    def image(content = nil, options = nil, html_options = nil, &)
      # Add position top to the image if the image is in top of the card
      options = (options || {}).merge(position: :top) if @header.nil? && @items.empty? && options.try(:[], :position).nil?
      @items << UiBibz::Ui::Core::Boxes::Components::CardImage.new(content, options, html_options, &).render
    end

    # Add a row whih is a component
    def row(content = nil, options = nil, html_options = nil, &block)
      options, content = inherit_options(content, options, block)
      @items << if tapped?(block)
                  UiBibz::Ui::Core::Boxes::Components::CardRow.new(content, options, html_options).tap(&block).render
                else
                  UiBibz::Ui::Core::Boxes::Components::CardRow.new(content, options, html_options, &block).render
                end
    end

    def inherit_options(content, options, block)
      if block.nil?
        options = (options || {}).merge({ outline: @options[:outline], status: @options[:status] })
      else
        content = (content || {}).merge({ outline: @options[:outline], status: @options[:status] })
      end
      [options, content]
    end
  end
end
