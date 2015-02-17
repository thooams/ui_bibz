class User < ActiveRecord::Base
  include UiBibz::Concerns::Models::Searchable

  searchable_attributes :name_fr, :name_en
end
