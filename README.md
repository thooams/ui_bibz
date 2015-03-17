# UiBibz

[![Build Status](https://travis-ci.org/thooams/Ui-Bibz.svg)](https://travis-ci.org/thooams/Ui-Bibz)
[![Code Climate](https://codeclimate.com/github/thooams/Ui-Bibz/badges/gpa.svg)](https://codeclimate.com/github/thooams/Ui-Bibz)
[![Test Coverage](https://codeclimate.com/github/thooams/Ui-Bibz/badges/coverage.svg)](https://codeclimate.com/github/thooams/Ui-Bibz)

This project rocks and uses MIT-LICENSE.




# Grid

Grid example.

```
= grid store: @documents do |g|
  - g.columns do |c|
    - c.add({ name: '#', data_index: 'id' })
    - c.add({ name: 'Name fr', data_index: 'name_fr', link: edit_document_path(:id)})
    - c.add({ name: 'Name en', data_index: 'name_en' })
    - c.add({ name: 'Category', data_index: 'category_name', sort: "categories.name_#{ I18n.locale}"  })
    - c.add({ name: 'Domain',  data_index: 'domain_name', sort: "domains.name_#{ I18n.locale }"  })
    - c.add({ name: 'Code fr', data_index: 'code_fr'  })
    - c.add({ name: 'Code en', data_index: 'code_en'  })
    - c.add({ name: 'Users', data_index: 'users', count: true  })
    - c.add({ name: 'Updated at', data_index: 'updated_at', date_format: arene_format_date })
    - c.add({ name: 'Status', data_index: 'status'  })
  - g.actions do
    = link_action t('ui_bibz.grid.actions.defaults.show'), documents_path(:id), glyph: 'eye'
    = link_action t('ui_bibz.grid.actions.defaults.edit'), edit_document_path(:id), glyph: 'pencil'
    = link_action t('ui_bibz.grid.actions.defaults.delete'), documents_path(:id), method: :delete, glyph: 'trash', data: { confirm: 'Are you sure?' }
    = link_action "---"
    = link_action t('ui_bibz.grid.actions.defaults.duplicate'), duplicate_document_path(:id), glyph: 'files-o'
    = link_action t('ui_bibz.grid.actions.document.alert'), alert_document_path(:id), glyph: 'bell'

```

