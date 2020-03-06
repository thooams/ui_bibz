# frozen_string_literal: true

class Country < ApplicationRecord
  belongs_to :continent
end
