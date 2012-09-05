class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :zayavka_id
      t.string :naim
      t.string :codyktved
      t.string :nomenkl
      t.integer :kolvo
      t.integer :factstoim
      t.string :dopinfo

      t.timestamps
    end
  end
end
