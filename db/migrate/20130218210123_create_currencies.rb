# -*- encoding : utf-8 -*-
class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name

      t.timestamps
    end
  end
end
