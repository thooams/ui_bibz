class Countries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string  :name
      t.integer :continent_id

      t.timestamps null: false
    end
  end
end
