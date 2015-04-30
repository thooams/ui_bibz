![Ui Bibz logo](doc/images/ui-bibz-logo-without-border.gif)

[![Build Status](https://travis-ci.org/thooams/Ui-Bibz.svg)](https://travis-ci.org/thooams/Ui-Bibz)
[![Code Climate](https://codeclimate.com/github/thooams/Ui-Bibz/badges/gpa.svg)](https://codeclimate.com/github/thooams/Ui-Bibz)
[![Test Coverage](https://codeclimate.com/github/thooams/Ui-Bibz/badges/coverage.svg)](https://codeclimate.com/github/thooams/Ui-Bibz)

This project rocks and uses MIT-LICENSE.

# UiBibz
> Ui Bibz est un framework d'interface permettant de construire une interface
> très rapidement et simplement à l'aide de Ruby on Rails 4 et de Boostrap 3.

Tous les composants de Ui Bibz comportent des *options* et des *html_options*.
Ces éléments sont basés sur l'élément ```Component```.
Un composant accepte un contenu par variable ou par block.
ex :

### Component
L'élément ```component``` acceptent en option les arguments :

* [state](#state-arguments)
* [glyph](#glyph-arguments)

```ruby
Component.new content = nil, options = nil, html_options = nil, &block
```

Ex :
```ruby
Component.new 'Exemple', { state: :success }, { class: 'exemple' }
# ou
Component.new { state: :success }, { class: 'exemple' } do
  'Exemple'
end
```

Ui Bibz charge la librairie [boostrap](http://getbootstrap.com/) et
[awesomefont](http://fontawesome.io/).

**NB** : J'utilise [HAML](http://haml.info/) pour présenter les exemples de chaque élément.
Vous pouvez bien entendu utiliser l'interpréteur ERB dans votre application Rails.


## Installation

Ajouter la gem dans Rails :

```ruby
gem "ui_bibz", github: 'thooams/ui_bibz', tag: 'v0.9.0'
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
!!!
%html
  %head
    ...
    = ui_bibz_meta_links
    ...
  %body
```


## Utilisation

### Alert

L'élément ```notify``` acceptent en option les arguments :

* [state](#state-arguments)
* [glyph](#glyph-arguments)

![alert](doc/images/alert.png)
```ruby
= notify 'toto', state: :info, glyph: 'eye'
```

### Breadcrumb (fil d'ariane)
L'élément ```breadcrumb``` acceptent en option les arguments :

* [status](#status-arguments)
* [glyph](#glyph-arguments)
* url

L'élément ```link``` est un [component](#component).

![breadcrumb](doc/images/breadcrumb.png)
```ruby
= breadcrumb do |b|
  - b.link 'toto', url: '#toto', glyph: 'home'
  - b.link 'momo', url: '#momo'
  - b.link 'nono', status: :active
```

### Buttons (Boutons)
#### Button
L'élément ```button``` acceptent en option les arguments :

* [state](#state-arguments)
* [status](#status-arguments)
* [glyph](#glyph-arguments)
* [size](#size-arguments)

![button](doc/images/button.png)
```ruby
= button 'Button', { state: :danger, size: :xs, glyph: 'star' } , { class: 'my-button' }
```

#### Button Dropdown
L'élément ```button_dropdown``` accepte pour options les mêmes arguments que l'élément
[dropdown](#dropdown).

![button_link](doc/images/button_dropdown.png)
```ruby
= button_dropdown 'Button Dropdown' do |bd|
  - bd.list link_to 'toto', '#'
  - bd.list 'header', type: :header
  - bd.list link_to 'momo', '#'
  - bd.list '---'
  - bd.list link_to 'lolo', '#'
```

#### Button group
L'élément ```button_group``` accepte pour options les arguments :

* position (:vertical, :horizontal)
* [size](#size-arguments)

L'élément ```list```accepte pour options les arguments :

* [status](#status-arguments)
* [state](#state-arguments)

![button_group](doc/images/button_group.png)
```ruby
= button_group position: :vertical, size: :xs do
  = button 'toto', status: :active
  = button 'momo'
  = button 'lolo'

= button_group do
  = button 'toto', status: :active
  = button 'momo'
  = button 'lolo'
  = button_dropdown 'Button Dropdown' do |bd|
    - bd.list 'header', type: :header
    - bd.list link_to 'momo', '#'
    - bd.list '---'
    - bd.list link_to 'lolo', '#'
```

#### Button Link (Lien Bouton)
L'élément ```button_link```accepte pour options les arguments :

![button_link](doc/images/button_link.png)
```ruby
= button_link 'Button', { url: '#button', state: :primary, glyph: 'star' }, { class: 'my-button' }
```

#### Button Split Dropdown
L'élément ```button_split_dropdown```accepte pour options les mêmes arguments
que l'élément [dropdown](#dropdown).


![button_group](doc/images/button_split_dropdown.png)
```ruby
= button_split_dropdown 'Dropdown', state: :primary do |d|
  - d.list do
    = link_to 'toto', "#"
  - d.list 'header', type: :header
  - d.list link_to 'momo', '#'
  - d.list '---'
  - d.list link_to 'lolo', '#'
```

### Dropdown (Menu déroulant)
L'élément ```dropdown```accepte pour options les arguments :

* [state](#state-arguments)
* [status](#status-arguments)
* position (:left, :right)

L'élément ```list``` est un [component](#component) qui accepte pour options les arguments :

* type (:header)
* [glyph](#glyph-arguments)

```ruby
= dropdown 'Dropdown', state: :success do |d|
  - d.list do
    = link_to 'toto', "#"
  - d.list 'header', type: :header
  - d.list link_to 'momo', '#'
  - d.list '---'
  - d.list link_to 'lolo', '#'
```

Pour ajouter une ligne séparatrice, il suffit d'insérer 3 "-" à la suite
ex :
```
...
d.list '--'
...
```

### Arguments

#### Status arguments
* :active
* :disable

#### Size arguments
* :xs
* :sm
* :lg

#### State arguments
* :default
* :primary
* :info
* :success
* :warning
* :danger

#### Glyph arguments
* name
* size
* type

### Glyph
Les glyphs utilisés proviennent de [Font Awesome](http://fontawesome.io/).
L'élément ```glyph``` acceptent pour options les arguments :

* size
* type

![glyph](doc/images/glyph.png)
```ruby
= glyph 'star', { size: 3, type: 'fw' }, class: 'star-exemple'
ou
= glyph { name: 'star', size: 3, type: 'fw' }
```

### Panel
L'élément ```panel``` acceptent pour options les arguments :

* [state](#state)
* tap (true) : permet de créer un header, body et footer

Les éléments ```header```, ```body```,```footer``` sont des éléments [component](#component).
Exemple :

![panel](doc/images/panel.png)
```ruby
= panel 'danger'
ou
= panel state: :danger do
  = 'toto'
ou
= panel({ tap: true, state: :danger }, { class: 'exemple' }) |p|
  - p.header 'toto', glyph: 'eye'
  - p.body class: 'my-body' do
    = 'toto'
  - p.footer 'toto'
```

### Table

L'élément ```table``` est un tableau composé d'une recherche, une pagination et un trie de colonnes intégré.
Le tableau est compatible [I18n](http://guides.rubyonrails.org/i18n.html).
Le tableau contient pour chaque ligne un bouton dropdown action avec par défaut
ces 3 actions : voir, éditer, supprimer. Toute les colonnes sont présentent et
affichées par défaut.

#### Table
La table doit contenir un store. Ce store est créé dans le controlleur.
La méthode ```grid_search_pagination``` contient 3 arguments :

* params
* session
* args

Exemple :
```ruby
# app/controllers/document_controller.rb
@documents = Document.table_search_pagination(params, session)
```

Dans le model, insérer la méthode ```searchable_attributes``` afin de pouvoir
faire une recherche sur les attributs souhaités.

Exemple :
```ruby
# app/models/document.rb
searchable_attributes :name_fr, :name_en
```

défaut 3 actions : éditer, voir et supprimer. Toutes les colonnes sont
présentent et affichées par défaut.

![grid](doc/images/grid.png)

#### Simple grid

Dans le **controlleur**, insérer la méthode ```grid_search_pagination```.
La méthode ```grid_search_pagination``` contient 3 arguments :

* params
* session
* args

Exemple :
```ruby
# app/controllers/document_controller.rb
@documents = Document.grid_search_pagination(params, session)
```

Dans le **model**, insérer la méthode ```searchable_attributes``` afin de pouvoir
faire une recherche pour les attributs souhaités.

Exemple :
```ruby
# app/models/document.rb
searchable_attributes :name_fr, :name_en
```


Dans la **vue**, insérer la méthode ```table``` qui peut contenir plusieurs arguments :

* store (ex: @documents)
* paginable (true)
* sortable (true)

Une grid comporte des **colonnes** et des **actions**.

Exemple :
```ruby
# app/views/documents/index.html.haml
= grid store: @documents
```

Les actions par défauts peuvent être modifiées (voir exemple complexe) :

* edit
* view
* delete

Elles sont intégrées à l'intérieur d'un bouton [dropdown](#dropdown).

Exemple :
```ruby
# app/views/documents/index.html.haml
= grid store: @documents do |g|
  - g.actions do
    = link_action 'Show', documents_path(:id), glyph: 'eye'
    = link_action 'Edit', edit_document_path(:id), glyph: 'pencil'
    = link_action 'Delete', documents_path(:id), method: :delete, glyph: 'trash', data: { confirm: 'Are you sure?' }
    = link_action "---"
    = link_action 'Duplicate', duplicate_document_path(:id), glyph: 'files-o'
    = link_action 'Alert', alert_document_path(:id), glyph: 'bell'
```

L'ajout de colonnes à travers la méthode ```add``` contient plusieurs arguments :

* name (nom de la colonne)
* data_index (le nom de l'attribut)
* count (utilise la méthode count sur l'élément)
* date_format (formate l'affichage de la date en utilisant la méthode ```strftime``` ex: '%Y/%M/%D')
* format (format les élement de la colone en utilisant **lambda**)
* link (ajoute un lien où :id est parsé et remplacé par l'entier correspondant)
* sort (permet de trier sur des champs )
* custom_sort (indique que le tableau sera triéé d'une manière personnalisée)

```ruby
# app/views/documents/index.html.haml
= grid store: @documents do |g|
  - g.columns do |c|
    - c.add { name: '#', data_index: 'id' }
    - c.add { name: 'Name fr', data_index: 'name_fr', link: edit_document_path(:id)}
    - c.add { data_index: 'name_en' }
    - c.add { name: 'Hotline', data_index: 'hotline_access', format: lambda{ |records, record| glyph(record.icon) }}
    - c.add { name: 'Updated at', data_index: 'updated_at', date_format: '%Y' }
```

#### Complex grid

Si on souhaite voir apparaître des liasions avec d'autres tables il faut pour
cela :

Dans le controlleur, insérer la méthode ```grid_search_pagination``` en ajoutant
un includes juste avant.

Exemple :
```ruby
# app/controllers/document_controller.rb
@documents = Document.includes(:users).grid_search_pagination(params, session)
```

Dans la vue, insérer la méthod ```grid```.
NB: On peut créer ces propres méthodes comme ```user_name``` dans notre model "Document" et
l'utiliser dans le data_index.

```ruby
# app/views/documents/index.html.haml
= grid store: @documents do |g|
  - g.columns do |c|
    - c.add { name: 'Users', data_index: 'user_name', sort: "user.name" }
```


#### Ultra Complex grid

Si l'on souhaite, par exemple, compter des utilisateurs qui ont un lien non
direct avec les documents. Imaginons qu'un utilisateur à des produits et que
ces produits contiennent plusieurs documents. On souhaite compté le nomble
d'utilisateurs par document.

On va pouvoir utiliser des arguments dans la méthode ```grid_search_pagination```
qui vont permettre des jointures.

Exemple :
```ruby
# app/controllers/document_controller.rb
arguments  = { sortable: {
  column: 'users',
  count:  true,
  joins: "LEFT OUTER JOIN documents_products ON documents_products.document_id = documents.id
          LEFT OUTER JOIN products ON products.id = documents_products.product_id
          LEFT OUTER JOIN products_users ON products_users.product_id = products.id
          LEFT OUTER JOIN users ON users.id = products_users.user_id"
} }

@documents = Document.includes(:users).grid_search_pagination(params, session,
arguments)
```
Ici l'argument sortable signifie que l'on souhaite s'occuper de la
fonctionnalité de trie.
Il faut :

* définir le nom de la colonne triéé à travers l'argument ```column:``` (string)
* définir si le traitement se fait sur le comptage avec l'argument ```count:```
  (boolean)
* définir la jointure avec l'argument ```joins:``` (string, array, hash)

Dans la vue :

```ruby
# app/views/documents/index.html.haml
= grid store: @documents do |g|
  - g.columns do |c|
    - c.add({ name: 'Users', data_index: 'users', count: true, custom_sort: true })
```

#### Grid I18n

La grid est entièrement traduisible avec I18n. L'importance des traductions
s'execute dans cette ordre pour la colonne "name_fr" par exemple.

1. ui_biz.grid.headers.document.name_fr
2. ui_biz.grid.headers.defaults.name_fr
3. activerecord.attributes.document.name_fr
4. activerecord.attributes.defaults.name_fr

Le placeholder du champ recherche est traduisible avec les attributs activerecord.

### List

Par défaut une liste à pour tag <li>. Mais elle peut se transformer en lien <a>
à travers l'option ```tag:``` et ```href:```.

![list](doc/images/list.png)

```ruby
= list_group do
  = list 'Exemple 1'
  = list 'Exemple 2', { tag: :a, href: '#exemple2'}, { class: 'active' }
  = list 'Exemple 3'
```

### Nav

![nav](doc/images/nav.png)

```ruby
= nav do
  = tab 'Exemple 1', active: true, selector: 'exemple-1'
  = tab 'Exemple 2', selector: 'exemple-2'
```

# A faire :

* intégrer la recherche avec les liaisons
* intégrer les couleurs et les badges pour les listes

