class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name_fr
      t.string :name_en
      t.string :body_fr
      t.string :body_en

      t.timestamps null: false
    end
  end
end
