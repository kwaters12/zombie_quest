class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :strength
      t.references :zombie, index: true

      t.timestamps
    end
  end
end
