![Ui Bibz logo](http://hummel.link/Ui-Bibz/1.1.3/images/ui-bibz-logo-without-border.gif)

[![Gem Version](https://badge.fury.io/rb/ui_bibz.svg)](http://badge.fury.io/rb/ui_bibz)
[![Build Status](https://travis-ci.org/thooams/Ui-Bibz.svg)](https://travis-ci.org/thooams/Ui-Bibz)
[![Code Climate](https://codeclimate.com/github/thooams/Ui-Bibz/badges/gpa.svg)](https://codeclimate.com/github/thooams/Ui-Bibz)
[![Test Coverage](https://codeclimate.com/github/thooams/Ui-Bibz/badges/coverage.svg)](https://codeclimate.com/github/thooams/Ui-Bibz)
[![Inline docs](http://inch-ci.org/github/thooams/Ui-Bibz.svg?branch=master)](http://inch-ci.org/github/thooams/Ui-Bibz)
[![security](https://hakiri.io/github/thooams/Ui-Bibz/master.svg)](https://hakiri.io/github/thooams/Ui-Bibz/master)
[![Dependency Status](https://gemnasium.com/thooams/Ui-Bibz.svg)](https://gemnasium.com/thooams/Ui-Bibz)

This project rocks and uses MIT-LICENSE.

# Ui Bibz
> Ui Bibz est un [framework d'interface](http://fr.wikipedia.org/wiki/Framework_d%27interface)
> permettant de construire une interface très rapidement et simplement
> à l'aide de [Ruby on Rails 4](http://rubyonrails.org/) et de [Boostrap 3](http://getbootstrap.com/).

Ui Bibz charge la librairie [boostrap](http://getbootstrap.com/) et
[awesomefont](http://fontawesome.io/).

Tous les composants du framework Ui Bibz comportent l'agument *options* et l'argument *html_options*.
Ces éléments sont basés sur l'élément ```Component```.
Un ```component``` accepte un contenu par variable ou par block.

### Component

L'élément ```component``` accepte dans content et block :

* le contenu

L'élément ```component``` à pour ```options``` un Hash acceptant les clefs :

* [state](#state-values)
* [glyph](#glyph-arguments)
* [status](#status-values)
* class


L'élément ```component``` à pour ```html_options``` un Hash acceptant les clefs :

* class
* data
* ...

Exemple :

```
Component.new 'Exemple', { state: :success, glyph: { name: 'pencil', size: 3} }, { class: 'exemple' }

Component.new { state: :success, glyph: 'eye' }, { class: 'exemple' } do
  'Exemple'
end
```

Signature :

```
Component.new content = nil, options = nil, html_options = nil, &block
```

**NB** : Pour des raisons de simplicité d'écriture, l'argument ```class``` est présent
dans ```options``` et ```html_options```.


## Installation

Ajouter la gem dans Rails :

```
gem "ui_bibz", '~> 1.0.0'
```

Lancer la command suivante :

```
bundle install
```

Placer la ligne suivante dans ```/app/views/layouts/application.rb```

```
 = ui_bibz_meta_links
```

Exemple ([haml](http://haml.info/)):
```
!!!
%html
  %head
    ...
    = ui_bibz_meta_links
    ...
  %body
```

Ui Bibz chargera les librairies en CDN directement dans votre application.
Si vous préférez charger les librairies en locales, utilisez plutôt la méthode ```ui_bibz_local_meta_links```
et insérez dans le fichier ```/config/initializers/assets.rb``` de votre
application ces 3-4 lignes:

```

# For awesome-font
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "fonts")
# For Ui bibz css
Rails.application.config.assets.precompile += %w(bootstrap.min.css bootstrap-theme.min.css font-awesome.min.css)
# For boostrap-theme (optionel)
Rails.application.config.assets.precompile += %w(bootstrap-theme.min.css)
# For Ui bibz js
Rails.application.config.assets.precompile += %w(jquery-2.1.4.min.js bootstrap.min.js)

```

Placer la ligne suivante dans ```/app/assets/stylesheets/applications.css```

```
...
*= require ui_bibz
...
```

Placer la ligne suivante dans ```/app/assets/javascripts/applications.js```

```
...
//= require ui_bibz
...
```

## Utilisation

### Alert

![alert](http://hummel.link/Ui-Bibz/1.1.3/images/alert.png)

L'élément ```notify``` à pour ```options``` un Hash acceptant les clefs :

* [state](#state-values)
* [glyph](#glyph-arguments)

```
notify 'Alert', state: :info, glyph: 'eye'
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/Alert.html)

### Breadcrumb (fil d'ariane)

![breadcrumb](http://hummel.link/Ui-Bibz/1.1.3/images/breadcrumb.png)

L'élément ```breadcrumb``` à pour enfant l'élément ```link``` qui accepte pour option un Hash avec les clefs :

* [status](#status-values)
* [glyph](#glyph-arguments)
* url

```
breadcrumb do |b|
  b.link 'Exemple 1', url: '#exemple-1', glyph: 'home'
  b.link({ url: '#exemple-2' }, { class:'link' }) do
    'Exemple 2'
  end
  b.link 'Exemple 3', status: :active
end
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/Breadcrumb.html)

### Buttons (Boutons)

#### Button

![button](http://hummel.link/Ui-Bibz/1.1.3/images/button.png)

L'élément ```button``` à pour ```options``` un Hash acceptant les clefs :

* [state](#state-values)
* [status](#status-values)
* [glyph](#glyph-arguments)
* [size](#size-values)

```
button 'Button', { state: :danger, size: :xs, glyph: 'star' } , { class: 'my-button' }
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/Button.html)

#### Button Dropdown

L'élément ```button_dropdown``` accepte pour options les mêmes clefs que l'élément
[dropdown](#dropdown).

![button_link](http://hummel.link/Ui-Bibz/1.1.3/images/button_dropdown.png)

```
button_dropdown 'Button Dropdown' do |bd|
  bd.link Link 1', '#'
  bd.header 'Header 1'
  bd.link 'Link 2'
  bd.divider
  bd.link 'Link 3', '#'
  bd.html link_to('Link 4', '#')
end
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/ButtonLink.html)

#### Button group

![button_group](http://hummel.link/Ui-Bibz/1.1.3/images/button_group.png)

L'élément ```button_group``` à pour ```options``` un Hash acceptant les clefs :

* position (:vertical, :horizontal)
* [size](#size-values)

L'élément ```list``` à pour ```options``` un Hash acceptant les clefs :

* [status](#status-values)
* [state](#state-values)

```ruby
button_group({ position: :vertical, size: :xs }) do
  button 'Button 1', status: :active
  button 'Button 2'
  button 'Button 3'
end

button_group do
  button 'Button 1', status: :active
  button 'Button 2'
  button 'Button 3'
  button_dropdown 'Button Dropdown' do |bd|
    bd.header 'header'
    bd.link 'Link 1', '#'
    bd.divider
    bd.link 'Link 2', '#'
  end
end
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/ButtonGroup.html)

#### Button Link (Lien Bouton)

![button_link](http://hummel.link/Ui-Bibz/1.1.3/images/button_link.png)

L'élément ```button_link``` à pour ```options``` un Hash acceptant les clefs :

```ruby
button_link 'Button', { url: '#button', state: :primary, glyph: 'star' }, { class: 'my-button' }
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/ButtonLink.html)

#### Button Split Dropdown

![button_group](http://hummel.link/Ui-Bibz/1.1.3/images/button_split_dropdown.png)

L'élément ```button_split_dropdown```accepte pour options les mêmes clefs
que l'élément [dropdown](#dropdown).

```ruby
button_split_dropdown 'Dropdown', state: :primary do |d|
  d.link url: "#" do
    'Link 1'
  end
  d.header 'Header 1'
  d.link 'Link 2', '#'
  d.divider
  d.link 'Link 3', '#'
end
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/ButtonSplitDropdown.html)

### Dropdown

L'élément ```dropdown``` à pour ```options``` un Hash acceptant les clefs :

* [state](#state-values)
* [status](#status-values)
* position (:left, :right)

L'élément ```list``` est un [component](#component) qui accepte pour options les clefs :

* type (:header)
* [glyph](#glyph-arguments)

```ruby
dropdown 'Dropdown', state: :success do |d|
  d.list do
    link_to 'Link 1', "#"
  end
  d.list 'Header 1', type: :header
  d.list link_to 'Link 2', '#'
  d.list '---'
  d.list link_to 'Link 3', '#'
end
```

Pour ajouter une ligne séparatrice, il suffit d'insérer 3 "-" à la suite

Exemple :

```
...
d.list '--'
...
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/Dropdown.html)

### Progress Bar

![glyph](http://hummel.link/Ui-Bibz/1.1.3/images/progress_bar.png)

L'élément ```progress_bar``` à pour ```options``` un Hash acceptant les clefs :

* [state](#state-values)
* type (:animated, :striped)
* label - String (default: "percentage%")
* tap - Boolean (true: To add several bars)
* percentage_min - Integer (default: 0)
* percentage_max - Integer (default: 100)
* sr_only - Boolean to show label (default: false)

```ruby
progress_bar 30

progress_bar state: :info, sr_only: true, type: :animated do
  70
end

progress_bar(tap: true) do |pb|
  pb.bar 10, { state: :success, label: 'Loading...' },{ class: 'test' }
  pb.bar 30, state: :warning
  pb.bar(type: :striped) do
    10
  end
end
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/ProgressBar.html)

### Glyph

![glyph](http://hummel.link/Ui-Bibz/1.1.3/images/glyph.png)

Les glyphs utilisés proviennent de [Font Awesome](http://fontawesome.io/).
L'élément ```glyph``` peut contenir un hash pour ```content```
L'élément ```glyph``` à pour ```options``` un Hash acceptant les clefs :

* size
* type

```ruby
glyph 'star', { size: 3, type: 'fw' }, class: 'star-exemple'

glyph { name: 'star', size: 3, type: 'fw' }
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/Glyph.html)

### Stars

![stars](http://hummel.link/Ui-Bibz/1.1.3/images/stars.png)

L'élément ```stars``` à pour ```options``` un Hash acceptant les clefs :

* num - Correspond au nombre d'étoiles affichées (default: 5)
* [state](#state-values)

```ruby
stars 3.2

stars 7, { num: 10, state: :danger }

stars num: 3 do
  1
end
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/Stars.html)


### Panel

![panel](http://hummel.link/Ui-Bibz/1.1.3/images/panel.png)

L'élément ```panel``` à pour ```options``` un Hash acceptant les clefs :

* [state](#state-values)
* tap (true) : permet de créer un header, body et footer

Les éléments ```header```, ```body```,```footer``` sont des éléments [component](#component).

Exemple :

```ruby
panel 'danger'

panel(state: :danger) do
  'Content'
end

panel({ tap: true, state: :danger, table_options: { actionable: true } }, { class: 'exemple' }) |p|
  p.header 'Header', glyph: 'eye'
  p.body(class: 'my-body') do
   'Content body'
  end
  p.footer 'Footer'
end
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/Panel.html)

### Table

![table](http://hummel.link/Ui-Bibz/1.1.3/images/table.png)

L'élément ```table``` est un tableau composé d'une recherche, une pagination et un trie de colonnes intégrées.
Le tableau est compatible [I18n](http://guides.rubyonrails.org/i18n.html).
Le tableau contient pour chaque ligne un bouton dropdown 'action' avec par défaut
ces 3 actions : voir, éditer, supprimer. Toutes les colonnes sont présentes et
affichées par défaut.

La table doit contenir un store. Ce store doit-être créé dans le *controlleur* avec la
méthode ```table_search_pagination```.

La méthode ```table_search_pagination``` contient 3 arguments :

* params
* session
* args (optionel)

Exemple :

```
# app/controllers/document_controller.rb
@documents = Document.table_search_pagination(params, session)
```

Dans le *model*, insérer la méthode ```searchable_attributes``` afin de pouvoir
faire une recherche sur les attributs souhaités.

Exemple :

```
# app/models/document.rb
searchable_attributes :name_fr, :name_en
```

Un champ recherche est disponible dans la vue :

![table_search_field](http://hummel.link/Ui-Bibz/1.1.3/images/table_search_field.png)

```
table_search_field store: @documents
```

Une pagination est disponible dans la vue :

```
table_pagination store: @documents
```

Un champs select par page est disponible dans la vue :

![table_search_field](http://hummel.link/Ui-Bibz/1.1.3/images/table_pagination_per_page.png)

```
table_pagination_per_page store: @documents
```

#### Simple Example table

Dans le **controlleur**, insérer la méthode ```table_search_pagination```.
La méthode ```table_search_pagination``` contient 3 arguments :

* params
* session
* args

Exemple :

```
# app/controllers/document_controller.rb
@documents = Document.table_search_pagination(params, session)
```

Dans le **model**, insérer la méthode ```searchable_attributes``` afin de pouvoir
faire une recherche sur les attributs souhaités. Vous pouvez même faire une
recherche sur une table différente en insérant un hash avec pour clef le nom du model et en valeur le nom
de l'attribut recherché.

Exemple :

```
# app/models/document.rb
searchable_attributes :name_fr, :name_en, user: :name
```

Dans la **vue**, insérer la méthode ```table``` qui peut contenir plusieurs arguments :

* store (ex: @documents)
* paginable (true, false)
* sortable (true, false)

Une table comporte des **colonnes** et des **actions**.

Exemple :

```
# app/views/documents/index.html.haml
table store: @documents
```

Les actions par défauts peuvent être modifiées ([voir exemple complexe](#Complex-Example-table)) :

* edit
* view
* delete

Elles sont intégrées à l'intérieur d'un bouton [dropdown](#dropdown).

Exemple :

```
# app/views/documents/index.html.haml
table store: @documents do |g|
  g.actions do |acs|
    acs.headr 'Main Actions'
    acs.link 'Show', documents_path(:id), glyph: 'eye'
    acs.link 'Edit', edit_document_path(:id), glyph: 'pencil'
    acs.link 'Delete', documents_path(:id), method: :delete, glyph: 'trash', data: { confirm: 'Are you sure?' }
    acs.divider
    acs.link 'Duplicate', duplicate_document_path(:id), glyph: 'files-o'
    acs.link 'Alert', alert_document_path(:id), glyph: 'bell'
  end
end
```

L'ajout de colonnes à travers la méthode ```column``` contient plusieurs arguments et cette méthode est basée sur le component :

* Content (ex: name)
* options (hash)
  * data_index (le nom de l'attribut)
  * count (utilise la méthode count sur l'élément)
  * date_format (formate l'affichage de la date en utilisant la méthode ```strftime``` ex: '%Y/%M/%D')
  * format (formate les élements de la colone en utilisant **lambda**)
  * link (ajoute un lien où l'expression ```:id``` est parsé et remplacé par l'entier correspondant)
  * sort (permet de trier sur des champs )
  * custom_sort (indique que le tableau sera triéé d'une manière personnalisée)
* html_options (hash)

```
# app/views/documents/index.html.haml
table store: @documents do |g|
  g.columns do |c|
    c.column :id, { name: '#' }
    c.column :name_fr, { name: 'Name fr', link: edit_document_path(:id) }
    c.column :name_en
    c.column :hotline_access, { name: 'Hotline', format: lambda{ |records, record| glyph(record.icon) } }
    c.column :update_at, { date_format: '%Y' }
  end
end
```

#### Complex Example table

Si on souhaite voir apparaître certaines liasions avec d'autres tables il faut pour
cela :

Dans le controlleur, insérer la méthode ```table_search_pagination``` en ajoutant
un ```includes``` juste avant.

Exemple :
```ruby
# app/controllers/document_controller.rb
@documents = Document.includes(:users).table_search_pagination(params, session)
```

Dans la vue, insérer la méthod ```table```.
NB: On peut créer ses propres méthodes comme ```user_name``` dans notre *model* "Document" et
l'appeler comme valeur pour la clef ```data_index```.

```
# app/views/documents/index.html.haml
table store: @documents do |g|
  g.columns do |c|
    c.column :user_name, { name: 'User', sort: "user.name" }
  end
end
```


#### Ultra Complex Example table

Si l'on souhaite, par exemple, dénombrer des utilisateurs qui ont un lien non
direct avec les documents.
Imaginons par exemple, un utilisateur à des produits et que
ces produits contiennent plusieurs documents. On souhaite compter le nombre
d'utilisateurs par documents.

On peut ajouter des arguments dans la méthode ```table_search_pagination```
qui vont permettre de faire des jointures.

Exemple :
```
# app/controllers/document_controller.rb
arguments  = { sortable: {
  column: 'users',
  count:  true,
  joins: "LEFT OUTER JOIN documents_products ON documents_products.document_id = documents.id
          LEFT OUTER JOIN products ON products.id = documents_products.product_id
          LEFT OUTER JOIN products_users ON products_users.product_id = products.id
          LEFT OUTER JOIN users ON users.id = products_users.user_id"
} }

@documents = Document.includes(:users).table_search_pagination(params, session, arguments)
```

Ici l'argument sortable signifie que l'on souhaite s'interresser à la
fonctionnalité de trie.

Pour celà il faut :

* définir le nom de la colonne triéé à travers l'argument ```column:``` (string)
* définir si le traitement se fait sur le comptage avec l'argument ```count:```
  (boolean)
* définir la jointure avec l'argument ```joins:``` (string, array, hash)

Dans la vue :

```
# app/views/documents/index.html.haml
table store: @documents do |g|
  g.columns do |c|
    c.column :users, { name: 'Users count', count: true, custom_sort: true }
  end
end
```

#### table actions

Les actions d'une table peuvent être formatées avec le 'record' passé en paramètre.

```
# app/views/documents/index.html.haml
table store: @documents do |t|
  t.columns do |cls|
    cls.column :id, { name: '#' }
    cls.column :name_en
  end
  t.actions do |acs|
    acs.format do |record|
      if record.active?
        acs.link 'Active', { url: active_document_path(record.id) }
      else
        acs.link 'Disabled', { url: disabled_document_path(record.id) }
      end
      acs.link 'Show', { url: document_path(record.id) }
    end
  end
end
```

Les actions ainsi que la colonne action peuvent être désactivées en passant l'agument ```actionable:
false```.

```
# app/views/documents/index.html.haml
table store: @documents, actionable: false
```

#### Plus d'une table sur une page html

Si vous avez plus d'une table sur votre page html et que vous souhaitez faire
des recherches, paginer... Vous devez identifier chaque store pour que l'action
effectuée (recherche, pagination,...) ne soit affectée que sur la table désirée.

Pour cela il faut que vous donniez un identifiant unique à vos stores.

ex:

```
# app/controllers/document_controller.rb
@documents = Document.includes(:users).table_search_pagination(params, session, { store_id: 'store-1'})
```


#### table I18n

La table est utilisable avec I18n. Les traductions
s'executent par ordre d'importance dans cet ordre précis pour la colonne "name_fr" par exemple.

1. ui_biz.table.headers.document.name_fr
2. ui_biz.table.headers.defaults.name_fr
3. activerecord.attributes.document.name_fr
4. activerecord.attributes.defaults.name_fr

Le placeholder du champ recherche est utilisable et traduisible avec les attributs activerecord dans le fichier locale.

Exemple :

```
# config/locales/fr.yml
...
activerecord:
  models:
      user: 'Utilisateur'
  attributes:
    defaults:
      name_fr: 'Nom fr'
...
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Ux/Table.html)

### Table Panel

![table_panel](http://hummel.link/Ui-Bibz/1.1.3/images/table_panel.png)

Le composant ```table_panel``` est un [tableau](#table) dans un [panel](#panel).

```
table_panel store: @users

table_panel({ store: @users, tap: true, glyph: 'home', state: :danger }) do |g|
  g.columns do |cls|
    cls.column :id, { name: '#' }
    cls.column :username, { name: 'Username', link: edit_user_path(:id) }
    cls.column :name
    cls.column(:email) do
      'Email'
    end
    cls.column :role_name, { name: 'Role', sort: 'roles.name' }
  end
  g.actions do |acs|
    acs.link 'Action 1', { url: edit_user_path(:id), glyph: 'pencil' }
    acs.divider
    acs.link { url: user_path(:id), glyph: 'eye' } do
      'Action 2'
    end
  end
end
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Ux/TablePanel.html)

### List

![list](http://hummel.link/Ui-Bibz/1.1.3/images/list.png)

Par défaut une liste à pour tag ```<li>```.
Mais elle peut se transformer en lien ```<a>``` à travers l'option ```type:```.
Par défaut le tag ```<li>``` est présent.

```
list_group type: :link do |lg|
  lg.list 'Momo', { state: :success, glyph: 'home' }, { href: '#Momo' }
  lg.list({ tap: true, status: :active }, { href: '#Toto' }) do |l|
    l.header 'My title'
    l.body 'My title'
  end
end

list_group do |lg|
  lg.list 'Momo', glyph: 'home', badge: 2
  lg.list 'Toto'
end
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/List.html)

### Nav

![nav](http://hummel.link/Ui-Bibz/1.1.3/images/nav.png)

Par défaut la navigation comporte des onglets "tab".
L'élément ```nav``` accepte en option les arguments :

* type (:pills, :tabs)
* position (:justified, :stacked)
* tap (true)

L'élement link est un [component](#component).

```
nav(type: :pills, position: :justified) do |d|
  d.link 'Link 1', url: '#test', badge: 6
  d.link(url: '#test2', status: :active) do
    "Link 2"
  end
end
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/Nav.html)

### Navbar

![navbar](http://hummel.link/Ui-Bibz/1.1.3/images/navbar.png)

Par défaut la navigation comporte des onglets "tab".
L'élément ```navbar``` accepte en option les arguments :

* type (:default, :inverse)
* [glyph](#glyph-values)
* position (:top, :bottom)
* title (string)

L'élement nav est un [component](#component) et contient les composants :

* form
* dropdown
* text
* link

```
navbar(type: :inverse, position: :top) do |nb|
  nb.nav do |n|
    n.link 'Link 1', url: '#link-1'
  end
  nb.nav(position: :right) do |n|
    n.link 'Link 2', url: '#test', badge: 6
    n.link(url: '#link-2', status: :active) do
      "Link 3"
    end
  end
end
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/Navbar.html)


### Etiquette

![list](http://hummel.link/Ui-Bibz/1.1.3/images/etiquette.png)


NB : Les méthodes ```Tag, label``` sont déjà utilisées par Rails.
L'élément ```etiquette``` à pour ```options``` un Hash acceptant les clefs :

* [state](#state-values)
* [glyph](#glyph-values)

Exemple :

```
etiquette 'label'
etiquette 'label 2', state: :success
etiquette 'label 2', state: :danger
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/Etiquette.html)

### Row

Le composant row génére une div avec la class row.

 ```
row class: 'toto' do
  'content'
end
# => <div class='row toto'>content</div>
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/Content.html)

### Col

L'élément ```col``` est un [composant](#composant) qui accèpte en arguments :

* num
* offset
* size

ou

* un tableau de hashes avec les arguments ```num```, ```offset``` et ```size``` à l'intérieur.

Ces paramètres génèrent les classes qui seront insérées dans la div avec la classe
col.


```
col({num: 2, size: :lg}, class: 'test') do
  'content'
end
# => <div class='col-lg-2 test'>content</div>


col([{ offset: 1, size: :xs}, { num: 3}], class: 'test') do
  'content'
end
# => <div class='col-xs-offset-1 col-md-3 test'>content</div>
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Core/Col.html)

### Grid

Une grid est un composant qui est composé de 5 vues :

* top
* right
* bottom
* left
* center

La vue **center** est obligatoire.
Une vue à pour arguments :

* position (:top, :left, :bottom, :right, :center)
* num (1..12) 12 étant le nombre limite de colonnes utilisable dans boostrap.

L'argument ```position``` détermine la position de la vue et l'argument ```num``` determine
le nombre de colonnes occupées par la vue.

```
grid do |g|
  g.view num: 3, position: :left do
    list_group(type: :link) do |lg|
      lg.list 'Link 1', { url: '#link1' }
      lg.list 'Link 2', { url: '#link1', status: :active }
      lg.list 'Link 1', { url: '#link1' }
      lg.list 'Link 3', { url: '#link1' }
      lg.list 'Link 4', { url: '#link1' }
    end
  end
  g.view({ position: :top}) do
    button_group(type: :toolbar) do
      button 'option 1'
      button 'option 2'
      button 'option 3'
    end
  end
  g.view position: :center do
    table store: @users, type: :bordered
  end
  g.view position: :bottom do
    'bottom'
  end
end

grid do |g|
  g.view num: 5, position: :left do
    'left'
  end
  g.view position: :right do
    'right'
  end
  g.view({ position: :top}, { class: 'success'}) do
    'top'
  end
  g.view position: :center do
    'center'
  end
  g.view position: :bottom do
    'bottom'
  end
end
```

Voir la [doc](http://hummel.link/Ui-Bibz/1.1.3/UiBibz/Ui/Ux/Grid.html)

### Arguments and Values

#### status-values
* :active
* :disable

#### size-values
* :xs
* :sm
* :lg

#### state-values
* :default
* :primary
* :info
* :success
* :warning
* :danger

#### glyph-arguments
* name
* size
* type

# Plus de détails

Pour plus d'informations, vous pouvez accéder à la documentation rdoc en
générant cette dernière :

```
rake rdoc
```

# Conflits

Certaines méthodes dans le helper peuvent être en conflit avec d'autres
librairies. Le cas échéant, vous pouvez utiliser directement la librairie UiBibz
comme ci-dessous.

Exemple :

```ruby
UiBibz::Ui::Core::Panel.new('Exemple', { state: :success }, { class: 'exemple'}).render
# au lieu de
panel 'Exemple', { state: :success }, { class: 'exemple' }
```

# Ui Bibz versions

* [Ui Bibz v1.1.0](http://hummel.link/Ui-Bibz/1.1.0/index.html)
* [Ui Bibz v1.1.1](http://hummel.link/Ui-Bibz/1.1.1/index.html)
* [Ui Bibz v1.1.2](http://hummel.link/Ui-Bibz/1.1.2/index.html)
* [Ui Bibz v1.1.3](http://hummel.link/Ui-Bibz/1.1.3/index.html)

# Roadmap

Pour la V2.

* créer des stores pour les listes, breadcrumb
* créer d'autres extensions, plugins et une guideline
* mise à jour vers bootstrap 4
...

