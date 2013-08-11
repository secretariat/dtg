# -*- encoding : utf-8 -*-
class AddEdizmColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :edizm, :string, :default => 'шт.'
  end
end
