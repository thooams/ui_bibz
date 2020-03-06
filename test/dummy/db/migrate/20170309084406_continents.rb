# frozen_string_literal: true

class Continents < ActiveRecord::Migration[5.0]
  def change
    create_table :continents do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
