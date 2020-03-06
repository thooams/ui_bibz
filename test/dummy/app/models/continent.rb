# frozen_string_literal: true

class Continent < ApplicationRecord
  has_many :countries
end
