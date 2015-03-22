![Ui Bibz logo](doc/ui-bibz-logo-without-border.gif)

[![Build Status](https://travis-ci.org/thooams/Ui-Bibz.svg)](https://travis-ci.org/thooams/Ui-Bibz)
[![Code Climate](https://codeclimate.com/github/thooams/Ui-Bibz/badges/gpa.svg)](https://codeclimate.com/github/thooams/Ui-Bibz)
[![Test Coverage](https://codeclimate.com/github/thooams/Ui-Bibz/badges/coverage.svg)](https://codeclimate.com/github/thooams/Ui-Bibz)

This project rocks and uses MIT-LICENSE.


# UiBibz
> Ui Bibz est un framework d'interface permettant de construire une interface
> très rapidement à l'aide de Ruby on Rails et de Boostrap.
> Ui Bibz est compatible HAML et SASS. Le framework requière **Ruby 2** et **Rails 4**.


Tous les composants de Ui Bibz comportent des *options* et des *html_options*.
Les composants sont basées sur la logique et le comportement de [link_to](http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to) présent dans Ruby on Rails
et acceptent les blocks.

Ui Bibz charge la librairie [boostrap](http://getbootstrap.com/) et
[awesomefont](http://fontawesome.io/).


## Installation

Ajouter la gem dans Rails :

```ruby
gem "ui_bibz", github: 'thooams/ui_bibz', tag: 'v0.5.0'
```

Lancer la command suivante :

```console
bundle install
```

Placer la ligne suivante dans ```/app/views/layouts/application.rb```
```ruby
 = ui_bibz_meta_links
```

Exemple :
```ruby
<!DOCTYPE html>
<html>
<head>
  ...
  <%= ui_bibz_meta_links %>
  ...
</head>
<body>
</body>
</html>
```


## Utilisation

### Breadcrumb (fil d'ariane)

![breadcrumb](doc/breadcrumb.png)
```ruby
= breadcrumb class: 'exemple' do
  = content_tag :li, content_tag(:a, "Home")
  = content_tag :li, content_tag(:a, "Library")
  = content_tag :li, content_tag(:a, "Data", class: 'active')

```

### Buttons (Boutons)
#### Button
Les boutons acceptent l'option ```type:``` avec pour arguments :

* :default
* :sucess,
* :primary
* :info
* :warning
* :danger

Les boutons acceptent l'option ```glyph:``` ([doc](#glyph)).

```ruby
= button 'Button', type: :danger, glyph: 'star', class: 'my-button'
```

#### Button Link (Lien Bouton)
Le lien boutton accèpte les mêmes paramètres que "button". A ceci près que le
lien button est un lien ```link_to```.

```ruby
= button_link 'Button', type: :danger, glyph: 'star', class: 'my-button'
```

#### Button Group (Liens groupés)

```ruby
= button_group class: 'exemple' do
  = button 'Button 1'
  = button 'Button 2'
  = button 'Button 3'
```

### Dropdown (Menu déroulant)
#### Dropdown (Menu déroulant)

Le menu déroulant accepte les options :

* ```glyph:``` ([doc](#glyph))
* ```type:``` avec pour arguments :
  * :default
  * :sucess,
  * :primary
  * :info
  * :warning
  * :danger
* ```position:```
  * left
  * right

L'ajout d'un séparateur dans le menu s'effectue avec 3 tirets : '---'

```ruby
= dropdown 'Action', glyph: { name: 'star', type: 'fw' }, position: 'left', type: :default,  class: 'exemple' do
  = content_tag :li, content_tag(:a, 'Menu 1')
  = content_tag :li, content_tag(:a, 'Menu 2')
  = '---'
  = content_tag :li, content_tag(:a, 'Menu 3')
```

#### Dropdown Button

### Glyph
Les glyphs utilisés proviennent de [Font Awesome](http://fontawesome.io/).
Les glyphs acceptent les options:

* name
* size
* type

```ruby
= glyph 'star'
ou
= glyph { name: 'star', size: 3, type: 'fw' }
```

### Grid

### List

### Nav




### Grid

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

