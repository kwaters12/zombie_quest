class CreateZombies < ActiveRecord::Migration
  def change
    create_table :zombies do |t|
      t.string :name
      t.integer :iq

      t.timestamps
    end
  end
end
