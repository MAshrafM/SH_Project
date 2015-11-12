class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.boolean :light
      t.boolean :door
      t.boolean :camera
      t.boolean :shade
      t.integer :ac
      t.references :room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
