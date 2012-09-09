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

      t.integer :pos_stavka
      t.integer :pos_summa
      t.integer :nalog_stavka
      t.integer :nalog_summa
      t.integer :neft_stavka
      t.integer :neft_summa
      t.integer :nds_stavka
      t.integer :nds_summa
      t.integer :vsego
      t.timestamps
    end
  end
end
