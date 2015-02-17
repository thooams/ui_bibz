class User < ActiveRecord::Base
  include Searchable

  searchable_attributes :name_fr, :name_en
end
