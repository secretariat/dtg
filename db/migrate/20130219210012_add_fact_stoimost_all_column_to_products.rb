# -*- encoding : utf-8 -*-
class AddFactStoimostAllColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :factstoim_all, :string
  end
end
