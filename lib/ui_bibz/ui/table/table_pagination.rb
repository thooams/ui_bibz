require 'will_paginate'
require "will_paginate-bootstrap"
require "ui_bibz/ui/table/components/store"
module UiBibz::Ui
  class TablePagination < Ui
    include WillPaginate::ActionView

    def initialize options = nil, html_options = nil
      @pagination = Component.new nil, options, html_options
    end

    def render
      will_paginate(store.records, params: { controller: store.controller },  renderer: BootstrapPagination::Rails)
    end

  private

    def store
      @store ||= if @pagination.options[:store].nil?
        raise 'Store is nil!'
      elsif @pagination.options[:store].try(:records).nil?
        raise 'Store can be created only with "table_search_pagination" method!'
      else
        Store.new @pagination.options.delete :store
      end
    end

  end
end
