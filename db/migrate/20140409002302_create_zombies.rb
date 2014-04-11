class CreateZombies < ActiveRecord::Migration
  def change
    create_table :zombies do |t|
      t.string :name
      t.integer :iq, default: 0
      t.boolean :vegetarian

      t.timestamps
    end
  end
end
