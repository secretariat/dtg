# -*- encoding : utf-8 -*-
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :zayavka_id
      t.string :naim
      t.string :codyktved
      t.string :nomenkl
      t.string :kolvo
      t.string :factstoim
      t.string :dopinfo
      t.string :opis_all

      t.string :pos_stavka
      t.string :pos_summa
      t.string :nalog_stavka
      t.string :nalog_summa
      t.string :neft_stavka
      t.string :neft_summa
      t.string :nds_stavka
      t.string :nds_summa
      t.string :vsego
      t.timestamps
    end
  end
end
