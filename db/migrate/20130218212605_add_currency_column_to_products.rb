# -*- encoding : utf-8 -*-
class AddCurrencyColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :currency, :string
  end
end
