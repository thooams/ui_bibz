# frozen_string_literal: true

module CardItemableConcern
  extend ActiveSupport::Concern

  included do
    # Add Header which is a component
    def header(content = nil, options = nil, html_options = nil, &block)
      options, content = inherit_options(content, options, block)
      @header = if tap?(content, options)
                  UiBibz::Ui::Core::Boxes::Components::CardHeader.new(content, options, html_options).tap(&block).render
                else
                  UiBibz::Ui::Core::Boxes::Components::CardHeader.new(content, options, html_options, &block).render
                end
    end

    # Add Body div which is a component
    def body(content = nil, options = nil, html_options = nil, &block)
      options, content = inherit_options(content, options, block)
      if tap?(content, options)
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
    def list_group(content = nil, options = nil, html_options = nil, &block)
      @items << UiBibz::Ui::Core::Boxes::Components::CardListGroup.new(content, options, html_options).tap(&block).render
    end

    # Add Image which is a component
    def image(content = nil, options = nil, html_options = nil, &block)
      @items << UiBibz::Ui::Core::Boxes::Components::CardImage.new(content, options, html_options, &block).render
    end

    # Add a row whih is a component
    def row(content = nil, options = nil, html_options = nil, &block)
      options, content = inherit_options(content, options, block)
      @items << if tap?(content, options)
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
