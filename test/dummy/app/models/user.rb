# frozen_string_literal: true

class User < ApplicationRecord
  include UiBibz::Concerns::Models::Searchable

  attr_accessor :name_fr_formula
  searchable_attributes :name_fr, :name_en
end
