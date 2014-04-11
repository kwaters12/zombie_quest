class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :iq, default: 0

      t.timestamps
    end
  end
end
