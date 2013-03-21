# -*- encoding : utf-8 -*-
class AddCurrencyColumnToZayavkas < ActiveRecord::Migration
  def change
    add_column :zayavkas, :z_currency, :string
  end
end
