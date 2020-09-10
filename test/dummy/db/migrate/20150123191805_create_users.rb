# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :name_fr
      t.string :name_en
      t.string :body_fr
      t.string :body_en
      t.boolean :active
      t.float   :price
      t.string  :price_formula

      t.timestamps null: false
    end
  end
end
